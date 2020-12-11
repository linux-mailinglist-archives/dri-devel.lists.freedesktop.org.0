Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E62D738A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 11:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829176ED1B;
	Fri, 11 Dec 2020 10:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2886ED1B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 10:11:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A584FAC10;
 Fri, 11 Dec 2020 10:11:43 +0000 (UTC)
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
References: <20201204151138.1739736-1-maxime@cerno.tech>
 <20201204151138.1739736-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 5/7] drm/vc4: kms: Remove unassigned_channels from the
 HVS state
Message-ID: <ea7e5cdf-f45a-cc62-3d93-d7f9a1409ecb@suse.de>
Date: Fri, 11 Dec 2020 11:11:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201204151138.1739736-6-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1186617329=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1186617329==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8CsgVUlgHggoOS5UjO2qw1YdQd699lHX7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8CsgVUlgHggoOS5UjO2qw1YdQd699lHX7
Content-Type: multipart/mixed; boundary="G9X4LYRXmU4IZQdRg06F3vjoA4wRm3WWo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Eric Anholt <eric@anholt.net>
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Message-ID: <ea7e5cdf-f45a-cc62-3d93-d7f9a1409ecb@suse.de>
Subject: Re: [PATCH v2 5/7] drm/vc4: kms: Remove unassigned_channels from the
 HVS state
References: <20201204151138.1739736-1-maxime@cerno.tech>
 <20201204151138.1739736-6-maxime@cerno.tech>
In-Reply-To: <20201204151138.1739736-6-maxime@cerno.tech>

--G9X4LYRXmU4IZQdRg06F3vjoA4wRm3WWo
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 04.12.20 um 16:11 schrieb Maxime Ripard:
> The HVS state now has both unassigned_channels that reflects the
> channels that are not used in the associated state, and the in_use
> boolean for each channel that says whether or not a particular channel
> is in use.
>=20
> Both express pretty much the same thing, and we need the in_use variabl=
e
> to properly track the commits, so let's get rid of unassigned_channels.=

>=20
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> index fdd698df5fbe..fa40c44eb770 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -39,7 +39,6 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct =
drm_private_state *priv)
>  =20
>   struct vc4_hvs_state {
>   	struct drm_private_state base;
> -	unsigned int unassigned_channels;
>  =20
>   	struct {
>   		unsigned in_use: 1;
> @@ -798,7 +797,6 @@ vc4_hvs_channels_duplicate_state(struct drm_private=
_obj *obj)
>  =20
>   	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
>  =20
> -	state->unassigned_channels =3D old_state->unassigned_channels;
>  =20
>   	for (i =3D 0; i < HVS_NUM_CHANNELS; i++) {
>   		state->fifo_state[i].in_use =3D old_state->fifo_state[i].in_use;
> @@ -849,7 +847,6 @@ static int vc4_hvs_channels_obj_init(struct vc4_dev=
 *vc4)
>   	if (!state)
>   		return -ENOMEM;
>  =20
> -	state->unassigned_channels =3D GENMASK(HVS_NUM_CHANNELS - 1, 0);
>   	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
>   				    &state->base,
>   				    &vc4_hvs_state_funcs);
> @@ -893,12 +890,17 @@ static int vc4_pv_muxing_atomic_check(struct drm_=
device *dev,
>   	struct vc4_hvs_state *hvs_new_state;
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	struct drm_crtc *crtc;
> +	unsigned int unassigned_channels;
>   	unsigned int i;
>  =20
>   	hvs_new_state =3D vc4_hvs_get_global_state(state);
>   	if (!hvs_new_state)
>   		return -EINVAL;
>  =20
> +	for (i =3D 0; i < HVS_NUM_CHANNELS; i++)
> +		if (!hvs_new_state->fifo_state[i].in_use)
> +			unassigned_channels |=3D BIT(i);
> +

More of a nit: I'd turn this block into a helper of struct=20
vc4_hvs_state. That would also remove the need to initialize=20
unassigned_channels to 0 here.

For the loop's condition, it might be less error prone to use=20
ARRAY_SIZE(hvs_new_state->fifo_state) instead of HVS_NUM_CHANNEL.

In any case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_=
state, i) {
>   		struct vc4_crtc_state *old_vc4_crtc_state =3D
>   			to_vc4_crtc_state(old_crtc_state);
> @@ -918,8 +920,6 @@ static int vc4_pv_muxing_atomic_check(struct drm_de=
vice *dev,
>   		/* If we're disabling our CRTC, we put back our channel */
>   		if (!new_crtc_state->enable) {
>   			channel =3D old_vc4_crtc_state->assigned_channel;
> -
> -			hvs_new_state->unassigned_channels |=3D BIT(channel);
>   			hvs_new_state->fifo_state[channel].in_use =3D false;
>   			new_vc4_crtc_state->assigned_channel =3D VC4_HVS_CHANNEL_DISABLED;=

>   			continue;
> @@ -949,13 +949,13 @@ static int vc4_pv_muxing_atomic_check(struct drm_=
device *dev,
>   		 * the future, we will need to have something smarter,
>   		 * but it works so far.
>   		 */
> -		matching_channels =3D hvs_new_state->unassigned_channels & vc4_crtc-=
>data->hvs_available_channels;
> +		matching_channels =3D unassigned_channels & vc4_crtc->data->hvs_avai=
lable_channels;
>   		if (!matching_channels)
>   			return -EINVAL;
>  =20
>   		channel =3D ffs(matching_channels) - 1;
>   		new_vc4_crtc_state->assigned_channel =3D channel;
> -		hvs_new_state->unassigned_channels &=3D ~BIT(channel);
> +		unassigned_channels &=3D ~BIT(channel);
>   		hvs_new_state->fifo_state[channel].in_use =3D true;
>   	}
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--G9X4LYRXmU4IZQdRg06F3vjoA4wRm3WWo--

--8CsgVUlgHggoOS5UjO2qw1YdQd699lHX7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/TRd4FAwAAAAAACgkQlh/E3EQov+Ad
hg/+LwZ84Lwjy07PhFjbTd60a3jpQm1OvCVjP8AL55ES53f6oRzz+iNXT1IoAEK32Rb9CFY6btlB
XhKHqQZKLoCw31BxrTKZUkmz2/3sSQYYhL3BlJxXOZXxtbvNk1pOJGeVsHw4knvqblqX4UCRhszV
XDdVkRFX2zSaPGhUMFI6aj3ZFba9tdsxrtVuK2Hf3kAnvf8BZC3YXbiy9OBimLxtFcFBRb5IeUOt
MvhShryE/QVDB3LeBWNngj1eC6AGqsFO2JOV0KxW/4KTER8kL4QYAORdHxgfokUVIHbYlKTC+9UN
D2bcevLoZdyGjb0YTKxXed9RYP3AjBwnOrb3Ty9ej/1YXwiupacQ5dr+LUiCLLJ5UpsWZeEf/ogx
ue0AsRavyy+3FnMxiiujN/JKmXOdjEuq7jMG3XsxmHhEaLaPKf52tFFtQlX2URIzwAQSS+HjuWus
cx9OBRsPlySu7uZc5wxZDq2jviRVfkdfdskF3/98V6kMrDIGQkwabBza+zcOWTEaaWR8SZLsGknp
QNU/eqirNq5Do9PjemK1MB5dgFtOjt4JhpaDLyKD5NtcY8vsabK2htqfjhKFFvtEMyE2Bil8ipOH
uG5u87hxTbkz3d3yVN2uYFNU6m7ZScpVsem9yYetsyEsFZoCMjh+zqMHfLSx4nSbZ5vzEVerYjou
2Z0=
=9P8q
-----END PGP SIGNATURE-----

--8CsgVUlgHggoOS5UjO2qw1YdQd699lHX7--

--===============1186617329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1186617329==--
