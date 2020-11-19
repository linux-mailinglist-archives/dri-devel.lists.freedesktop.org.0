Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0242B8E4C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B006E50C;
	Thu, 19 Nov 2020 08:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B217889CC4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 08:59:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46EC4AD31;
 Thu, 19 Nov 2020 08:59:17 +0000 (UTC)
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-7-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 6/7] drm/vc4: kms: Store the unassigned channel list in
 the state
Message-ID: <c733bc70-8535-e4b9-1db6-a7b51e2781a7@suse.de>
Date: Thu, 19 Nov 2020 09:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105135656.383350-7-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1693914218=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1693914218==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Oi7AvY65G3xAJBsaMT0ftobatwcz7JZTf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Oi7AvY65G3xAJBsaMT0ftobatwcz7JZTf
Content-Type: multipart/mixed; boundary="ClrxqTxfzC8SZXuU3jAGgHEkRdaYYcvNI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Cc: Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-rpi-kernel@lists.infradead.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Message-ID: <c733bc70-8535-e4b9-1db6-a7b51e2781a7@suse.de>
Subject: Re: [PATCH v3 6/7] drm/vc4: kms: Store the unassigned channel list in
 the state
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-7-maxime@cerno.tech>
In-Reply-To: <20201105135656.383350-7-maxime@cerno.tech>

--ClrxqTxfzC8SZXuU3jAGgHEkRdaYYcvNI
Content-Type: multipart/mixed;
 boundary="------------F00D6C6C13C26C6D00FCEB58"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F00D6C6C13C26C6D00FCEB58
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.20 um 14:56 schrieb Maxime Ripard:
> If a CRTC is enabled but not active, and that we're then doing a page
> flip on another CRTC, drm_atomic_get_crtc_state will bring the first
> CRTC state into the global state, and will make us wait for its vblank
> as well, even though that might never occur.
>=20
> Instead of creating the list of the free channels each time atomic_chec=
k
> is called, and calling drm_atomic_get_crtc_state to retrieve the
> allocated channels, let's create a private state object in the main
> atomic state, and use it to store the available channels.
>=20
> Since vc4 has a semaphore (with a value of 1, so a lock) in its commit
> implementation to serialize all the commits, even the nonblocking ones,=
 we
> are free from the use-after-free race if two subsequent commits are not=
 ran
> in their submission order.
>=20
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatic=
ally")
> Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_drv.h |   1 +
>   drivers/gpu/drm/vc4/vc4_kms.c | 124 +++++++++++++++++++++++++++------=
-
>   2 files changed, 100 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index bdbb9540d47d..014113823647 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -219,6 +219,7 @@ struct vc4_dev {
>  =20
>   	struct drm_modeset_lock ctm_state_lock;
>   	struct drm_private_obj ctm_manager;
> +	struct drm_private_obj hvs_channels;
>   	struct drm_private_obj load_tracker;
>  =20
>   	/* List of vc4_debugfs_info_entry for adding to debugfs once
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> index 499c6914fce4..0a231ae500e5 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -37,6 +37,17 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct=
 drm_private_state *priv)
>   	return container_of(priv, struct vc4_ctm_state, base);
>   }
>  =20
> +struct vc4_hvs_state {
> +	struct drm_private_state base;
> +	unsigned int unassigned_channels;
> +};
> +
> +static struct vc4_hvs_state *
> +to_vc4_hvs_state(struct drm_private_state *priv)
> +{
> +	return container_of(priv, struct vc4_hvs_state, base);
> +}
> +
>   struct vc4_load_tracker_state {
>   	struct drm_private_state base;
>   	u64 hvs_load;
> @@ -662,6 +673,70 @@ static int vc4_load_tracker_obj_init(struct vc4_de=
v *vc4)
>   	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fin=
i, NULL);
>   }
>  =20
> +static struct drm_private_state *
> +vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
> +{
> +	struct vc4_hvs_state *state;
> +
> +	state =3D kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> +
> +	return &state->base;
> +}
> +
> +static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj=
,
> +					   struct drm_private_state *state)
> +{
> +	struct vc4_hvs_state *hvs_state;
> +
> +	hvs_state =3D to_vc4_hvs_state(state);
> +	kfree(hvs_state);
> +}
> +
> +static const struct drm_private_state_funcs vc4_hvs_state_funcs =3D {
> +	.atomic_duplicate_state =3D vc4_hvs_channels_duplicate_state,
> +	.atomic_destroy_state =3D vc4_hvs_channels_destroy_state,
> +};
> +
> +static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *un=
used)
> +{
> +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> +
> +	drm_atomic_private_obj_fini(&vc4->hvs_channels);
> +}
> +
> +static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
> +{
> +	struct vc4_hvs_state *state;
> +
> +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	state->unassigned_channels =3D GENMASK(HVS_NUM_CHANNELS - 1, 0);
> +	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
> +				    &state->base,
> +				    &vc4_hvs_state_funcs);
> +
> +	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini=
, NULL);
> +}
> +
> +static struct vc4_hvs_state *
> +vc4_hvs_get_global_state(struct drm_atomic_state *state)
> +{
> +	struct vc4_dev *vc4 =3D to_vc4_dev(state->dev);
> +	struct drm_private_state *priv_state;
> +
> +	priv_state =3D drm_atomic_get_private_obj_state(state, &vc4->hvs_chan=
nels);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_vc4_hvs_state(priv_state);
> +}
> +
>   /*
>    * The BCM2711 HVS has up to 7 output connected to the pixelvalves an=
d
>    * the TXP (and therefore all the CRTCs found on that platform).
> @@ -678,6 +753,14 @@ static int vc4_load_tracker_obj_init(struct vc4_de=
v *vc4)
>    *   need to consider all the running CRTCs in the DRM device to assi=
gn
>    *   a FIFO, not just the one in the state.
>    *
> + * - To fix the above, we can't use drm_atomic_get_crtc_state on all
> + *   enabled CRTCs to pull their CRTC state into the global state, sin=
ce
> + *   a page flip would start considering their vblank to complete. Sin=
ce
> + *   we don't have a guarantee that they are actually active, that
> + *   vblank might never happen, and shouldn't even be considered if we=

> + *   want to do a page flip on a single CRTC. That can be tested by
> + *   doing a modetest -v first on HDMI1 and then on HDMI0.
> + *
>    * - Since we need the pixelvalve to be disabled and enabled back whe=
n
>    *   the FIFO is changed, we should keep the FIFO assigned for as lon=
g
>    *   as the CRTC is enabled, only considering it free again once that=

> @@ -687,46 +770,33 @@ static int vc4_load_tracker_obj_init(struct vc4_d=
ev *vc4)
>   static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
>   				      struct drm_atomic_state *state)
>   {
> -	unsigned long unassigned_channels =3D GENMASK(HVS_NUM_CHANNELS - 1, 0=
);
> +	struct vc4_hvs_state *hvs_state;
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	struct drm_crtc *crtc;
>   	unsigned int i;
>  =20
> -	/*
> -	 * Since the HVS FIFOs are shared across all the pixelvalves and
> -	 * the TXP (and thus all the CRTCs), we need to pull the current
> -	 * state of all the enabled CRTCs so that an update to a single
> -	 * CRTC still keeps the previous FIFOs enabled and assigned to
> -	 * the same CRTCs, instead of evaluating only the CRTC being
> -	 * modified.
> -	 */
> -	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> -		struct drm_crtc_state *crtc_state;
> -
> -		if (!crtc->state->enable)
> -			continue;
> -
> -		crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> -		if (IS_ERR(crtc_state))
> -			return PTR_ERR(crtc_state);
> -	}
> +	hvs_state =3D vc4_hvs_get_global_state(state);
> +	if (!hvs_state)
> +		return -EINVAL;

I found this confusing. It's technically correct, but from hvs_state is=20
not clear that it's the new state. Maybe call it hvs_new_state.

If you want to be pedantic, maybe split the creation of the new state=20
from the usage. Call vc4_hvs_get_global_state() at the top of=20
vc4_atomic_check() to make the new state. (Maybe with a short comment.)=20
And here only call an equivalent of=20
drm_atomic_get_new_private_obj_state() for hvs_channels.

In any case

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>  =20
>   	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_=
state, i) {
> +		struct vc4_crtc_state *old_vc4_crtc_state =3D
> +			to_vc4_crtc_state(old_crtc_state);
>   		struct vc4_crtc_state *new_vc4_crtc_state =3D
>   			to_vc4_crtc_state(new_crtc_state);
>   		struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>   		unsigned int matching_channels;
>  =20
> -		if (old_crtc_state->enable && !new_crtc_state->enable)
> +		if (old_crtc_state->enable && !new_crtc_state->enable) {
> +			hvs_state->unassigned_channels |=3D BIT(old_vc4_crtc_state->assigne=
d_channel);
>   			new_vc4_crtc_state->assigned_channel =3D VC4_HVS_CHANNEL_DISABLED;=

> +		}
>  =20
>   		if (!new_crtc_state->enable)
>   			continue;
>  =20
> -		if (new_vc4_crtc_state->assigned_channel !=3D VC4_HVS_CHANNEL_DISABL=
ED) {
> -			unassigned_channels &=3D ~BIT(new_vc4_crtc_state->assigned_channel)=
;
> +		if (new_vc4_crtc_state->assigned_channel !=3D VC4_HVS_CHANNEL_DISABL=
ED)
>   			continue;
> -		}
>  =20
>   		/*
>   		 * The problem we have to solve here is that we have
> @@ -752,12 +822,12 @@ static int vc4_pv_muxing_atomic_check(struct drm_=
device *dev,
>   		 * the future, we will need to have something smarter,
>   		 * but it works so far.
>   		 */
> -		matching_channels =3D unassigned_channels & vc4_crtc->data->hvs_avai=
lable_channels;
> +		matching_channels =3D hvs_state->unassigned_channels & vc4_crtc->dat=
a->hvs_available_channels;
>   		if (matching_channels) {
>   			unsigned int channel =3D ffs(matching_channels) - 1;
>  =20
>   			new_vc4_crtc_state->assigned_channel =3D channel;
> -			unassigned_channels &=3D ~BIT(channel);
> +			hvs_state->unassigned_channels &=3D ~BIT(channel);
>   		} else {
>   			return -EINVAL;
>   		}
> @@ -841,6 +911,10 @@ int vc4_kms_load(struct drm_device *dev)
>   	if (ret)
>   		return ret;
>  =20
> +	ret =3D vc4_hvs_channels_obj_init(vc4);
> +	if (ret)
> +		return ret;
> +
>   	drm_mode_config_reset(dev);
>  =20
>   	drm_kms_helper_poll_init(dev);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------F00D6C6C13C26C6D00FCEB58
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------F00D6C6C13C26C6D00FCEB58--

--ClrxqTxfzC8SZXuU3jAGgHEkRdaYYcvNI--

--Oi7AvY65G3xAJBsaMT0ftobatwcz7JZTf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+2M+MFAwAAAAAACgkQlh/E3EQov+BI
6w//QmL0AIsOLGhoKaGn5JDn2/fmTkC7ZUkx7tJm8DUZRyrGvBKV3lohV2fjbF3+2I2YglEQ7ASh
S919OOiOjvAGHWCoCNVeNZJur2EZAjDYij8vmLMghH2NqquVvm7m9QtxojmNeLOGv2suO2XL04nI
bwHg7XY3FplMBNTIZEqv6qIkl/i1EnLeTBgmgYpT1HRiLmlZc7HliOV3e0KBHqnYIMeNpZhDMOa5
Ly1WjeHQHdBuUgPlgSkX/iKFpEBodNJILyt34b42R7vOyXftiIdhbMlk3o+jx/cV/oqYc3lBFyAZ
ZbvXzmnzNCoAS4TTfgft7/Pkq8fvECq2MrhcYNWW2oQwuM1U/MNsEsGWV8KdNpOV4tiMtCxVgOQI
OiZqd8tPQavOiZM9p7SSWPlh4CfBs8zUFgGeXAepn4OqRA0xhIDFn8/Xaqfd0RtX3rSWz0qHb8yb
tah5qyUySnb6jTDB6Kp8o8RZT9T4osj8LtVMt4LcFzjYGePnFaj2noC/jszzQfsMk7E2DrJtDtCW
ogtjVo2kWkUVfyY1udZoAcaOUtIH9joq1EmtJqXoM8jEyjrbtjFPGlpw5Qmw+tJJlp4xV7FbRpwC
AxYzz/YVOecXoVOSrbTrzHHKBVGhV0c3311tqBQN+x9FTMfcT5XihyUBl4pZPOhd0RShvgXD6OZd
l0g=
=I8kQ
-----END PGP SIGNATURE-----

--Oi7AvY65G3xAJBsaMT0ftobatwcz7JZTf--

--===============1693914218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1693914218==--
