Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 008978C73EF
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 11:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5866710EC32;
	Thu, 16 May 2024 09:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QBKJ+EGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28B110EC32
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 09:36:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A8D126168B;
 Thu, 16 May 2024 09:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DFAC32786;
 Thu, 16 May 2024 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715852180;
 bh=DD6VkVQwYr5qx+QtEY3TjdvNx99y2R6fc5bKmJrT/yU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QBKJ+EGRMsSNdlLBhmx53NWlpf+CzZyD6Xltp3lapOO4kKjqkEIyYWYTJ6IgNfD+J
 dpGkuxqkwdVly4WexTyd0WNIiGgZ93P9AaZVBpOxARuVE03VwQRspXwiSG56EiR3hz
 dTFlBUMwmy5ZDKI3/+8pcHBnYMLn2JmGwFOS8W95AywbGZdhpupmQzo475khgSIRoo
 RTrao7VNnZ0ENZondAbSeVjp4MpC5Fd0b3RtR/5A+uJKniHE9J9D0mfpvF3DEckH7O
 FSPYDwomE7Erk+SMone0rTuL5aHot6mbrHEYsWD/zCSDwyUs/QjZ17V0rlze2utFsC
 U9B7RXNH6AoOw==
Date: Thu, 16 May 2024 11:36:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v13 27/28] drm/rockchip: inno_hdmi: Switch to HDMI
 connector
Message-ID: <20240516-romantic-goose-of-fame-ef968f@penduick>
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
 <20240507-kms-hdmi-connector-state-v13-27-8fafc5efe8be@kernel.org>
 <2d3073ce.16e2.18f6bec1d61.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uaerwrggzaiekave"
Content-Disposition: inline
In-Reply-To: <2d3073ce.16e2.18f6bec1d61.Coremail.andyshrk@163.com>
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


--uaerwrggzaiekave
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Sun, May 12, 2024 at 04:29:47PM +0800, Andy Yan wrote:
> At 2024-05-07 21:17:45, "Maxime Ripard" <mripard@kernel.org> wrote:
> >The new HDMI connector infrastructure allows to remove some boilerplate,
> >especially to generate infoframes. Let's switch to it.
> >
> >Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >Acked-by: Heiko Stuebner <heiko@sntech.de>
> >Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >---
> > drivers/gpu/drm/rockchip/Kconfig       |   3 +
> > drivers/gpu/drm/rockchip/inno_hdmi.c   | 153 ++++++++++++--------------=
-------
> > drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |   3 +
> > 3 files changed, 61 insertions(+), 98 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip=
/Kconfig
> >index 1bf3e2829cd0..7df875e38517 100644
> >--- a/drivers/gpu/drm/rockchip/Kconfig
> >+++ b/drivers/gpu/drm/rockchip/Kconfig
> >@@ -72,10 +72,13 @@ config ROCKCHIP_DW_MIPI_DSI
> > 	  enable MIPI DSI on RK3288 or RK3399 based SoC, you should
> > 	  select this option.
> >=20
> > config ROCKCHIP_INNO_HDMI
> > 	bool "Rockchip specific extensions for Innosilicon HDMI"
> >+	select DRM_DISPLAY_HDMI_HELPER
> >+	select DRM_DISPLAY_HDMI_STATE_HELPER
> >+	select DRM_DISPLAY_HELPER
> > 	help
> > 	  This selects support for Rockchip SoC specific extensions
> > 	  for the Innosilicon HDMI driver. If you want to enable
> > 	  HDMI on RK3036 based SoC, you should select this option.
> >=20
> >diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rock=
chip/inno_hdmi.c
> >index 3df2cfcf9998..5069403c3b80 100644
> >--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
> >+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
> >@@ -20,10 +20,13 @@
> > #include <drm/drm_edid.h>
> > #include <drm/drm_of.h>
> > #include <drm/drm_probe_helper.h>
> > #include <drm/drm_simple_kms_helper.h>
> >=20
> >+#include <drm/display/drm_hdmi_helper.h>
> >+#include <drm/display/drm_hdmi_state_helper.h>
> >+
> ......
> >=20
> > static int inno_hdmi_config_video_csc(struct inno_hdmi *hdmi)
> > {
> > 	struct drm_connector *connector =3D &hdmi->connector;
> > 	struct drm_connector_state *conn_state =3D connector->state;
> >@@ -359,12 +323,12 @@ static int inno_hdmi_config_video_csc(struct inno_=
hdmi *hdmi)
> > 	value =3D v_VIDEO_INPUT_BITS(VIDEO_INPUT_8BITS) |
> > 		v_VIDEO_OUTPUT_COLOR(0) |
> > 		v_VIDEO_INPUT_CSP(0);
> > 	hdmi_writeb(hdmi, HDMI_VIDEO_CONTRL2, value);
> >=20
> >-	if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_RGB) {
> >-		if (inno_conn_state->rgb_limited_range) {
> >+	if (conn_state->hdmi.output_format =3D=3D HDMI_COLORSPACE_RGB) {
> >+		if (conn_state->hdmi.is_limited_range) {
> > 			csc_mode =3D CSC_RGB_0_255_TO_RGB_16_235_8BIT;
> > 			auto_csc =3D AUTO_CSC_DISABLE;
> > 			c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> > 			csc_enable =3D v_CSC_ENABLE;
> >=20
> >@@ -378,18 +342,18 @@ static int inno_hdmi_config_video_csc(struct inno_=
hdmi *hdmi)
> > 				  v_VIDEO_C0_C2_SWAP(C0_C2_CHANGE_DISABLE));
> > 			return 0;
> > 		}
> > 	} else {
> > 		if (inno_conn_state->colorimetry =3D=3D HDMI_COLORIMETRY_ITU_601) {
> >-			if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_YUV444) {
> >+			if (conn_state->hdmi.output_format =3D=3D HDMI_COLORSPACE_YUV444) {
> > 				csc_mode =3D CSC_RGB_0_255_TO_ITU601_16_235_8BIT;
> > 				auto_csc =3D AUTO_CSC_DISABLE;
> > 				c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> > 				csc_enable =3D v_CSC_ENABLE;
> > 			}
> > 		} else {
> >-			if (inno_conn_state->enc_out_format =3D=3D HDMI_COLORSPACE_YUV444) {
> >+			if (conn_state->hdmi.output_format =3D=3D HDMI_COLORSPACE_YUV444) {
> > 				csc_mode =3D CSC_RGB_0_255_TO_ITU709_16_235_8BIT;
> > 				auto_csc =3D AUTO_CSC_DISABLE;
> > 				c0_c2_change =3D C0_C2_CHANGE_DISABLE;
> > 				csc_enable =3D v_CSC_ENABLE;
> > 			}
> >@@ -460,14 +424,16 @@ static int inno_hdmi_config_video_timing(struct in=
no_hdmi *hdmi,
> >=20
> > 	return 0;
> > }
> >=20
> > static int inno_hdmi_setup(struct inno_hdmi *hdmi,
> >-			   struct drm_display_mode *mode)
> >+			   struct drm_crtc_state *new_crtc_state,
> >+			   struct drm_connector_state *new_conn_state)
> > {
> >-	struct drm_display_info *display =3D &hdmi->connector.display_info;
> >-	unsigned long mpixelclock =3D mode->clock * 1000;
> >+	struct drm_connector *connector =3D &hdmi->connector;
> >+	struct drm_display_info *display =3D &connector->display_info;
> >+	struct drm_display_mode *mode =3D &new_crtc_state->adjusted_mode;
> >=20
> > 	/* Mute video and audio output */
> > 	hdmi_modb(hdmi, HDMI_AV_MUTE, m_AUDIO_MUTE | m_VIDEO_BLACK,
> > 		  v_AUDIO_MUTE(1) | v_VIDEO_MUTE(1));
> >=20
> >@@ -477,26 +443,26 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
> >=20
> > 	inno_hdmi_config_video_timing(hdmi, mode);
> >=20
> > 	inno_hdmi_config_video_csc(hdmi);
> >=20
> >-	if (display->is_hdmi)
> >-		inno_hdmi_config_video_avi(hdmi, mode);
> >+	drm_atomic_helper_connector_hdmi_update_infoframes(connector,
> >+							   new_conn_state->state);
> >=20
>=20
> new_conn_state->state will be set NULL in drm_atomic_helper_swap_state,
> so this will cause a NULL pointer reference panic here.

That's a good catch, I'll fix it, thanks!
Maxime

--uaerwrggzaiekave
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkXTkAAKCRAnX84Zoj2+
drHFAX0WNL3Wj3Fov5y9wmbhRlVOE3cZBO2OqCK8lFoIx3jXXKZebGyaAtxrBPIm
NWKddK8BgK5/Qs7oRmknzpUJJMceIrrXhv1HUGmQ9aVTrxk9JlXkqf8DDsZaKwVr
nNmDraUwrg==
=4TDG
-----END PGP SIGNATURE-----

--uaerwrggzaiekave--
