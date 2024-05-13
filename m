Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415A8C4568
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2A010E46A;
	Mon, 13 May 2024 16:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BqEQzbCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4310E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:56:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEC5B60EAD
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B547BC113CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715619400;
 bh=JIJL96Zc6ds0Ix56YJZa1/yvCl+qJCfnOfiXdV82f/0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BqEQzbCY8CC7quZCofjT5ox0BHd4s7Z7GjaOvq3/Um53eGo51m7JIY7WfWFKlqAeZ
 4+gUqtfja7P2Obwp1MD/RPtLFALE3SH0hcFRxXad2BSC4z1TTvIF3e22PEGXoD2Yx3
 VzJFHzEfBz6JPoKhgXFYfWvCPQJZx/5Ab6NA1qAjZsgl8zWwINkRYyWjPxerepej7S
 hAIk6+DweRa61WCQm05i/cBCQ1zrcDn9FX1YCrDz6ZkyjoDPyHhpVziYPQ1/b2kFtm
 8NXNnqfFKmdAuix0XaKSzS2kZkDk1gtjRgGvEFfg+TpAvNPeo05lsGSe/aSzKYr6UE
 MQDYKkPVGy3CA==
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-23f5a31d948so3160810fac.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 09:56:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YxyxrgGtgfwYj5xqtOLFmJio5W5zteElqjm2CfRCuHTUJK0U1mL
 rRPizYwXOMH3jRlOPtcK0/UtwHu1tm2XIgdtdc5Cab7z9amtlPjFpRVXGhA8XrwzFZH1yIlcb3W
 x4te8QdXmzY8vJCcA5HlMbwVLClXyKDMnocw5KA==
X-Google-Smtp-Source: AGHT+IHO5qT97VmiAjkWMhNY3uZDKv8Om115F6TyCETm2kXOLNdDd9slEmXnyxdKqhLuMX9gumxOXVitF4g0PnaWywY=
X-Received: by 2002:a05:6871:5b13:b0:22e:cd9f:4e55 with SMTP id
 586e51a60fabf-24172f83cddmr13346179fac.50.1715619400104; Mon, 13 May 2024
 09:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715353572.git.jani.nikula@intel.com>
 <c4dfde81b98a4e938ef1e253b05550cad96e49be.1715353572.git.jani.nikula@intel.com>
In-Reply-To: <c4dfde81b98a4e938ef1e253b05550cad96e49be.1715353572.git.jani.nikula@intel.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 13 May 2024 18:56:28 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4BL7Lm1DvYquU9_CKWrweV_v41omQp7z3fRuG1vtMQeg@mail.gmail.com>
Message-ID: <CAN6tsi4BL7Lm1DvYquU9_CKWrweV_v41omQp7z3fRuG1vtMQeg@mail.gmail.com>
Subject: Re: [RESEND 2/6] drm/radeon: convert to using is_hdmi and has_audio
 from display info
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
> Prefer the parsed results for is_hdmi and has_audio in display info over
> calling drm_detect_hdmi_monitor() and drm_detect_monitor_audio(),
> respectively.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/radeon/atombios_encoders.c | 10 +++++-----
>  drivers/gpu/drm/radeon/evergreen_hdmi.c    |  5 ++---
>  drivers/gpu/drm/radeon/radeon_audio.c      |  6 +++---
>  drivers/gpu/drm/radeon/radeon_connectors.c | 12 ++++++------
>  drivers/gpu/drm/radeon/radeon_display.c    |  2 +-
>  drivers/gpu/drm/radeon/radeon_encoders.c   |  4 ++--
>  6 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm=
/radeon/atombios_encoders.c
> index 2bff0d9e20f5..0aa395fac36f 100644
> --- a/drivers/gpu/drm/radeon/atombios_encoders.c
> +++ b/drivers/gpu/drm/radeon/atombios_encoders.c
> @@ -701,7 +701,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder=
)
>                         if (radeon_connector->use_digital &&
>                             (radeon_connector->audio =3D=3D RADEON_AUDIO_=
ENABLE))
>                                 return ATOM_ENCODER_MODE_HDMI;
> -                       else if (drm_detect_hdmi_monitor(radeon_connector=
_edid(connector)) &&
> +                       else if (connector->display_info.is_hdmi &&
>                                  (radeon_connector->audio =3D=3D RADEON_A=
UDIO_AUTO))
>                                 return ATOM_ENCODER_MODE_HDMI;
>                         else if (radeon_connector->use_digital)
> @@ -720,7 +720,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder=
)
>                 if (radeon_audio !=3D 0) {
>                         if (radeon_connector->audio =3D=3D RADEON_AUDIO_E=
NABLE)
>                                 return ATOM_ENCODER_MODE_HDMI;
> -                       else if (drm_detect_hdmi_monitor(radeon_connector=
_edid(connector)) &&
> +                       else if (connector->display_info.is_hdmi &&
>                                  (radeon_connector->audio =3D=3D RADEON_A=
UDIO_AUTO))
>                                 return ATOM_ENCODER_MODE_HDMI;
>                         else
> @@ -737,14 +737,14 @@ atombios_get_encoder_mode(struct drm_encoder *encod=
er)
>                 if ((dig_connector->dp_sink_type =3D=3D CONNECTOR_OBJECT_=
ID_DISPLAYPORT) ||
>                     (dig_connector->dp_sink_type =3D=3D CONNECTOR_OBJECT_=
ID_eDP)) {
>                         if (radeon_audio !=3D 0 &&
> -                           drm_detect_monitor_audio(radeon_connector_edi=
d(connector)) &&
> +                           connector->display_info.has_audio &&
>                             ASIC_IS_DCE4(rdev) && !ASIC_IS_DCE5(rdev))
>                                 return ATOM_ENCODER_MODE_DP_AUDIO;
>                         return ATOM_ENCODER_MODE_DP;
>                 } else if (radeon_audio !=3D 0) {
>                         if (radeon_connector->audio =3D=3D RADEON_AUDIO_E=
NABLE)
>                                 return ATOM_ENCODER_MODE_HDMI;
> -                       else if (drm_detect_hdmi_monitor(radeon_connector=
_edid(connector)) &&
> +                       else if (connector->display_info.is_hdmi &&
>                                  (radeon_connector->audio =3D=3D RADEON_A=
UDIO_AUTO))
>                                 return ATOM_ENCODER_MODE_HDMI;
>                         else
> @@ -755,7 +755,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder=
)
>                 break;
>         case DRM_MODE_CONNECTOR_eDP:
>                 if (radeon_audio !=3D 0 &&
> -                   drm_detect_monitor_audio(radeon_connector_edid(connec=
tor)) &&
> +                   connector->display_info.has_audio &&
>                     ASIC_IS_DCE4(rdev) && !ASIC_IS_DCE5(rdev))
>                         return ATOM_ENCODER_MODE_DP_AUDIO;
>                 return ATOM_ENCODER_MODE_DP;
> diff --git a/drivers/gpu/drm/radeon/evergreen_hdmi.c b/drivers/gpu/drm/ra=
deon/evergreen_hdmi.c
> index 681119c91d94..09dda114e218 100644
> --- a/drivers/gpu/drm/radeon/evergreen_hdmi.c
> +++ b/drivers/gpu/drm/radeon/evergreen_hdmi.c
> @@ -412,7 +412,7 @@ void evergreen_hdmi_enable(struct drm_encoder *encode=
r, bool enable)
>         if (enable) {
>                 struct drm_connector *connector =3D radeon_get_connector_=
for_encoder(encoder);
>
> -               if (connector && drm_detect_monitor_audio(radeon_connecto=
r_edid(connector))) {
> +               if (connector && connector->display_info.has_audio) {
>                         WREG32(HDMI_INFOFRAME_CONTROL0 + dig->afmt->offse=
t,
>                                HDMI_AVI_INFO_SEND | /* enable AVI info fr=
ames */
>                                HDMI_AVI_INFO_CONT | /* required for audio=
 info values to be updated */
> @@ -450,8 +450,7 @@ void evergreen_dp_enable(struct drm_encoder *encoder,=
 bool enable)
>         if (!dig || !dig->afmt)
>                 return;
>
> -       if (enable && connector &&
> -           drm_detect_monitor_audio(radeon_connector_edid(connector))) {
> +       if (enable && connector && connector->display_info.has_audio) {
>                 struct drm_connector *connector =3D radeon_get_connector_=
for_encoder(encoder);
>                 struct radeon_connector *radeon_connector =3D to_radeon_c=
onnector(connector);
>                 struct radeon_connector_atom_dig *dig_connector;
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/rade=
on/radeon_audio.c
> index 74753bb26d33..16c10db3ce6f 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -409,7 +409,7 @@ void radeon_audio_detect(struct drm_connector *connec=
tor,
>                         radeon_encoder->audio =3D rdev->audio.hdmi_funcs;
>                 }
>
> -               if (drm_detect_monitor_audio(radeon_connector_edid(connec=
tor))) {
> +               if (connector->display_info.has_audio) {
>                         if (!dig->pin)
>                                 dig->pin =3D radeon_audio_get_pin(encoder=
);
>                         radeon_audio_enable(rdev, dig->pin, 0xf);
> @@ -646,7 +646,7 @@ static void radeon_audio_hdmi_mode_set(struct drm_enc=
oder *encoder,
>         if (!connector)
>                 return;
>
> -       if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
> +       if (connector->display_info.has_audio) {
>                 radeon_audio_set_mute(encoder, true);
>
>                 radeon_audio_write_speaker_allocation(encoder);
> @@ -686,7 +686,7 @@ static void radeon_audio_dp_mode_set(struct drm_encod=
er *encoder,
>         if (!connector)
>                 return;
>
> -       if (drm_detect_monitor_audio(radeon_connector_edid(connector))) {
> +       if (connector->display_info.has_audio) {
>                 radeon_audio_write_speaker_allocation(encoder);
>                 radeon_audio_write_sad_regs(encoder);
>                 radeon_audio_write_latency_fields(encoder, mode);
> diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm=
/radeon/radeon_connectors.c
> index b84b58926106..81b5c3c8f658 100644
> --- a/drivers/gpu/drm/radeon/radeon_connectors.c
> +++ b/drivers/gpu/drm/radeon/radeon_connectors.c
> @@ -109,7 +109,7 @@ int radeon_get_monitor_bpc(struct drm_connector *conn=
ector)
>         case DRM_MODE_CONNECTOR_DVII:
>         case DRM_MODE_CONNECTOR_HDMIB:
>                 if (radeon_connector->use_digital) {
> -                       if (drm_detect_hdmi_monitor(radeon_connector_edid=
(connector))) {
> +                       if (connector->display_info.is_hdmi) {
>                                 if (connector->display_info.bpc)
>                                         bpc =3D connector->display_info.b=
pc;
>                         }
> @@ -117,7 +117,7 @@ int radeon_get_monitor_bpc(struct drm_connector *conn=
ector)
>                 break;
>         case DRM_MODE_CONNECTOR_DVID:
>         case DRM_MODE_CONNECTOR_HDMIA:
> -               if (drm_detect_hdmi_monitor(radeon_connector_edid(connect=
or))) {
> +               if (connector->display_info.is_hdmi) {
>                         if (connector->display_info.bpc)
>                                 bpc =3D connector->display_info.bpc;
>                 }
> @@ -126,7 +126,7 @@ int radeon_get_monitor_bpc(struct drm_connector *conn=
ector)
>                 dig_connector =3D radeon_connector->con_priv;
>                 if ((dig_connector->dp_sink_type =3D=3D CONNECTOR_OBJECT_=
ID_DISPLAYPORT) ||
>                     (dig_connector->dp_sink_type =3D=3D CONNECTOR_OBJECT_=
ID_eDP) ||
> -                   drm_detect_hdmi_monitor(radeon_connector_edid(connect=
or))) {
> +                   connector->display_info.is_hdmi) {
>                         if (connector->display_info.bpc)
>                                 bpc =3D connector->display_info.bpc;
>                 }
> @@ -150,7 +150,7 @@ int radeon_get_monitor_bpc(struct drm_connector *conn=
ector)
>                 break;
>         }
>
> -       if (drm_detect_hdmi_monitor(radeon_connector_edid(connector))) {
> +       if (connector->display_info.is_hdmi) {
>                 /* hdmi deep color only implemented on DCE4+ */
>                 if ((bpc > 8) && !ASIC_IS_DCE4(rdev)) {
>                         DRM_DEBUG("%s: HDMI deep color %d bpc unsupported=
. Using 8 bpc.\n",
> @@ -1478,7 +1478,7 @@ static enum drm_mode_status radeon_dvi_mode_valid(s=
truct drm_connector *connecto
>                     (radeon_connector->connector_object_id =3D=3D CONNECT=
OR_OBJECT_ID_DUAL_LINK_DVI_D) ||
>                     (radeon_connector->connector_object_id =3D=3D CONNECT=
OR_OBJECT_ID_HDMI_TYPE_B))
>                         return MODE_OK;
> -               else if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor(ra=
deon_connector_edid(connector))) {
> +               else if (ASIC_IS_DCE6(rdev) && connector->display_info.is=
_hdmi) {
>                         /* HDMI 1.3+ supports max clock of 340 Mhz */
>                         if (mode->clock > 340000)
>                                 return MODE_CLOCK_HIGH;
> @@ -1774,7 +1774,7 @@ static enum drm_mode_status radeon_dp_mode_valid(st=
ruct drm_connector *connector
>                     (radeon_dig_connector->dp_sink_type =3D=3D CONNECTOR_=
OBJECT_ID_eDP)) {
>                         return radeon_dp_mode_valid_helper(connector, mod=
e);
>                 } else {
> -                       if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor=
(radeon_connector_edid(connector))) {
> +                       if (ASIC_IS_DCE6(rdev) && connector->display_info=
.is_hdmi) {
>                                 /* HDMI 1.3+ supports max clock of 340 Mh=
z */
>                                 if (mode->clock > 340000)
>                                         return MODE_CLOCK_HIGH;
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/ra=
deon/radeon_display.c
> index 5f1d24d3120c..843383f7237f 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1722,7 +1722,7 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc=
 *crtc,
>                             (!(mode->flags & DRM_MODE_FLAG_INTERLACE)) &&
>                             ((radeon_encoder->underscan_type =3D=3D UNDER=
SCAN_ON) ||
>                              ((radeon_encoder->underscan_type =3D=3D UNDE=
RSCAN_AUTO) &&
> -                             drm_detect_hdmi_monitor(radeon_connector_ed=
id(connector)) &&
> +                             connector->display_info.is_hdmi &&
>                               is_hdtv_mode(mode)))) {
>                                 if (radeon_encoder->underscan_hborder !=
=3D 0)
>                                         radeon_crtc->h_border =3D radeon_=
encoder->underscan_hborder;
> diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/r=
adeon/radeon_encoders.c
> index 3de3dce9e89d..0f723292409e 100644
> --- a/drivers/gpu/drm/radeon/radeon_encoders.c
> +++ b/drivers/gpu/drm/radeon/radeon_encoders.c
> @@ -386,7 +386,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encode=
r *encoder,
>         case DRM_MODE_CONNECTOR_HDMIB:
>                 if (radeon_connector->use_digital) {
>                         /* HDMI 1.3 supports up to 340 Mhz over single li=
nk */
> -                       if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor=
(radeon_connector_edid(connector))) {
> +                       if (ASIC_IS_DCE6(rdev) && connector->display_info=
.is_hdmi) {
>                                 if (pixel_clock > 340000)
>                                         return true;
>                                 else
> @@ -408,7 +408,7 @@ bool radeon_dig_monitor_is_duallink(struct drm_encode=
r *encoder,
>                         return false;
>                 else {
>                         /* HDMI 1.3 supports up to 340 Mhz over single li=
nk */
> -                       if (ASIC_IS_DCE6(rdev) && drm_detect_hdmi_monitor=
(radeon_connector_edid(connector))) {
> +                       if (ASIC_IS_DCE6(rdev) && connector->display_info=
.is_hdmi) {
>                                 if (pixel_clock > 340000)
>                                         return true;
>                                 else
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
