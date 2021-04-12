Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E235C1BB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5A16E093;
	Mon, 12 Apr 2021 09:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9500D6E093
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:44:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2022AAEFB;
 Mon, 12 Apr 2021 09:44:08 +0000 (UTC)
Subject: Re: [PATCH 07/18] drm/vc4: hdmi: Add full range RGB helper
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-8-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <316878dc-8661-e111-27e1-ac8ab3bfc13c@suse.de>
Date: Mon, 12 Apr 2021 11:44:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-8-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0525265174=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0525265174==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3svIc2ne78SsvZWxrJRz4kboLFCFUpiuq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3svIc2ne78SsvZWxrJRz4kboLFCFUpiuq
Content-Type: multipart/mixed; boundary="idfvWMEp6ywaGAkOjDF66Ira2zcCsxuF9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Message-ID: <316878dc-8661-e111-27e1-ac8ab3bfc13c@suse.de>
Subject: Re: [PATCH 07/18] drm/vc4: hdmi: Add full range RGB helper
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-8-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-8-maxime@cerno.tech>

--idfvWMEp6ywaGAkOjDF66Ira2zcCsxuF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> We're going to need to tell whether we want to run with a full or
> limited range RGB output in multiple places in the code, so let's creat=
e
> a helper that will return whether we need with full range or not.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

although with a comments

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index eee9751009c2..fc545072b173 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -95,6 +95,15 @@
>  =20
>   #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
>  =20
> +static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
> +				       const struct drm_display_mode *mode)
> +{
> +	struct vc4_hdmi_encoder *vc4_encoder =3D &vc4_hdmi->encoder;
> +
> +	return !vc4_encoder->hdmi_monitor ||

Is this ever being called from non-HDMI code? If not, I'd put an=20
drm_WARN_ONCE around this check.

> +		drm_default_rgb_quant_range(mode) =3D=3D HDMI_QUANTIZATION_RANGE_FUL=
L;
> +}
> +
>   static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
>   {
>   	struct drm_info_node *node =3D (struct drm_info_node *)m->private;
> @@ -833,8 +842,7 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct=20
drm_encoder *encoder,
>   	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder=
);
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  =20
> -	if (vc4_encoder->hdmi_monitor &&
> -	    drm_default_rgb_quant_range(mode) =3D=3D HDMI_QUANTIZATION_RANGE_=
LIMITED) {
> +	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode) {
>   		if (vc4_hdmi->variant->csc_setup)
>   			vc4_hdmi->variant->csc_setup(vc4_hdmi, true);
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--idfvWMEp6ywaGAkOjDF66Ira2zcCsxuF9--

--3svIc2ne78SsvZWxrJRz4kboLFCFUpiuq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0FmYFAwAAAAAACgkQlh/E3EQov+Ay
5hAArqyaEHnu0hHsPt50lzmRXXijy62hNLqkPBhb5NwROr3xqQh2s8FqrXVR6FyOj9oMBVOvI6Hl
11z0CsXR/NUnxjjw3gyJIJzxTiAVCwzE9LVEC6Nf/Mvb4uTBEpgCIRUIk45aHJPt/HMx60maGyyM
dj3eoD7luJ+S/UEAUyp+EahxAJkIlLs1vkUjov3t32xiecPyEBOiNZt9oMBc39h39oWD34kcSXRa
UCw1gksoWIWIDlX0R85IWaHO0C+x1o1pfx+P3qmxW2DRXm6wABfd4e5/sQsCRLzhguXU37xfE5c2
CirFHvQ7NrKcLT0TspMUvENQTbjoOTtZZdjpHwh/h/8nR3xr06I2VblM6BKppSFUZS/EvrzDpVc+
IZRHujTpzBuJUR0pGIbioOMlGl4VYRcBXRLsl5uZa1EC0aVv3XI5j6iBzJAgB5jREHysD8w7smQ5
DSdCfrkdplko34R5KoraZgfn/FkC5rL3W2Ijsvtc77JIllf7wRjUO7V+Hv5+xMJtZjaYervHjK2L
3Ke0kBtKaj/XKV7mRYy+u4AH44S98OA+ETaMgmuAvTfzuegmvKoHegi7FpzvANKGIIXaiDcS90Dh
zOpnr94cj468tu4qCVHvfavVEI2oNCBVRS7CpxVMJD8fpOvWvrjqXtUjuo1Thm1W+dXK3AeGXFu7
w6I=
=+iMB
-----END PGP SIGNATURE-----

--3svIc2ne78SsvZWxrJRz4kboLFCFUpiuq--

--===============0525265174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0525265174==--
