Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2524F9E0118
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A519910E6EA;
	Mon,  2 Dec 2024 11:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IQU65M29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF6C10E6EA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A45BB5C63C7;
 Mon,  2 Dec 2024 11:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11493C4CED1;
 Mon,  2 Dec 2024 11:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733140788;
 bh=JT1goFQcBxa4ii8FS7z1ezsrRpulliTnkPm8vr3KN/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IQU65M29d4OkFYaktMObE4+dzjrLv2EARU7k8bNOGcBEZKTpy11ajBjFV3NjkfxDc
 ipAeZoa4J75VD+tj9FpOD1vSnEpb+wGzbwpcPpCQm2CEgEh5Dw29RVkE/CQUBRtZK/
 VRO3oMkNytO3tw3kY25QZeiJ9vqn5EfonwofWCUNmO0/55tsQ4bHUrCCw7/kk962jp
 h6wA9MFZZlJHxicg8reArWn21AGwxnociD8DQoeRpWEULZQwNDjvDNoWgXe7jMNmI4
 zgeeXOcw6QavU+12hqcUqVYMBcwBBttzcAEzLOoegU3zto2RqbjyIOalcG490m/NWv
 bkOOYIvgL1cHA==
Date: Mon, 2 Dec 2024 12:59:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/connector: hdmi: Add support for YUV420 format
 verification
Message-ID: <20241202-divergent-holistic-seal-b24cd6@houat>
References: <20241130-hdmi-conn-yuv-v1-0-254279a08671@collabora.com>
 <20241130-hdmi-conn-yuv-v1-2-254279a08671@collabora.com>
 <20241202-determined-sloppy-impala-2ca0f1@houat>
 <a00ba6bb-aa91-4ecf-a4e7-88d80e29dedc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qszps75hpkmz2px4"
Content-Disposition: inline
In-Reply-To: <a00ba6bb-aa91-4ecf-a4e7-88d80e29dedc@collabora.com>
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


--qszps75hpkmz2px4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] drm/connector: hdmi: Add support for YUV420 format
 verification
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 01:15:36PM +0200, Cristian Ciocaltea wrote:
> Hi Maxime,
>=20
> On 12/2/24 12:50 PM, Maxime Ripard wrote:
> > On Sat, Nov 30, 2024 at 01:56:33AM +0200, Cristian Ciocaltea wrote:
> >> Provide the necessary constraints verification in
> >> sink_supports_format_bpc() in order to support handling of YUV420
> >> output format.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 40 ++++++++++++++++=
+++++++--
> >>  1 file changed, 37 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers=
/gpu/drm/display/drm_hdmi_state_helper.c
> >> index 0cbcee7e77cd8dff387044487ce28ee5748f5587..3a55881a544a519bb12549=
68db891c814f831a0f 100644
> >> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> >> @@ -3,6 +3,7 @@
> >>  #include <drm/drm_atomic.h>
> >>  #include <drm/drm_connector.h>
> >>  #include <drm/drm_edid.h>
> >> +#include <drm/drm_modes.h>
> >>  #include <drm/drm_print.h>
> >> =20
> >>  #include <drm/display/drm_hdmi_helper.h>
> >> @@ -114,6 +115,12 @@ sink_supports_format_bpc(const struct drm_connect=
or *connector,
> >>  		return false;
> >>  	}
> >> =20
> >> +	if (drm_mode_is_420_only(info, mode) && format !=3D HDMI_COLORSPACE_=
YUV420) {
> >> +		drm_dbg_kms(dev, "%s format unsupported by the sink for VIC%u.\n",
> >> +			    drm_hdmi_connector_get_output_format_name(format), vic);
> >> +		return false;
> >> +	}
> >> +
> >>  	switch (format) {
> >>  	case HDMI_COLORSPACE_RGB:
> >>  		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
> >> @@ -144,9 +151,36 @@ sink_supports_format_bpc(const struct drm_connect=
or *connector,
> >>  		return true;
> >> =20
> >>  	case HDMI_COLORSPACE_YUV420:
> >> -		/* TODO: YUV420 is unsupported at the moment. */
> >> -		drm_dbg_kms(dev, "YUV420 format isn't supported yet.\n");
> >> -		return false;
> >> +		drm_dbg_kms(dev, "YUV420 format, checking the constraints.\n");
> >> +
> >> +		if (!(info->color_formats & DRM_COLOR_FORMAT_YCBCR420)) {
> >> +			drm_dbg_kms(dev, "Sink doesn't support YUV420.\n");
> >> +			return false;
> >> +		}
> >> +
> >> +		if (!drm_mode_is_420(info, mode)) {
> >> +			drm_dbg_kms(dev, "Sink doesn't support YUV420 for VIC%u.\n", vic);
> >> +			return false;
> >> +		}
> >> +
> >> +		if (bpc =3D=3D 10 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420=
_DC_30)) {
> >> +			drm_dbg_kms(dev, "10 BPC but sink doesn't support Deep Color 30.\n=
");
> >> +			return false;
> >> +		}
> >> +
> >> +		if (bpc =3D=3D 12 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420=
_DC_36)) {
> >> +			drm_dbg_kms(dev, "12 BPC but sink doesn't support Deep Color 36.\n=
");
> >> +			return false;
> >> +		}
> >> +
> >> +		if (bpc =3D=3D 16 && !(info->hdmi.y420_dc_modes & DRM_EDID_YCBCR420=
_DC_48)) {
> >> +			drm_dbg_kms(dev, "16 BPC but sink doesn't support Deep Color 48.\n=
");
> >> +			return false;
> >> +		}
> >> +
> >> +		drm_dbg_kms(dev, "YUV420 format supported in that configuration.\n"=
);
> >> +
> >> +		return true;
> >=20
> > We also need to check whether the source supports it or not.
>=20
> I assumed the following check does already handle that:
>=20
> 	if (!(connector->hdmi.supported_formats & BIT(format))) {
> 		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
>=20
> Is there anything else missing?

You're right, sorry for the noise :)

Maxime

--qszps75hpkmz2px4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ02hMQAKCRAnX84Zoj2+
dqoHAYCBfSK4ZS5Gd9mS0d+JLRzapEFV5fr78HzDzNKbnbEZQwdYlPBi81IbgIrM
flOgo/ABf1u9jUouNbvdN0FJ83tM0gMkLAXQDn1b0cLqcqx96dSkBZmZwYN++jBs
1ZvUEZJGEw==
=Yos7
-----END PGP SIGNATURE-----

--qszps75hpkmz2px4--
