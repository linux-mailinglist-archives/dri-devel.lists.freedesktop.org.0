Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2ED2BAAFB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 14:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F366E8B6;
	Fri, 20 Nov 2020 13:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA416E8B6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 13:19:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D292FAC23;
 Fri, 20 Nov 2020 13:19:46 +0000 (UTC)
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-7-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 6/8] drm/vc4: kms: Wait on previous FIFO users before a
 commit
Message-ID: <8c5f37b3-a4ff-d4d0-ebe0-8bc931416293@suse.de>
Date: Fri, 20 Nov 2020 14:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113152956.139663-7-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1771806381=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1771806381==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VALBUU2xZoGekyZWFY5Jl4XxZvxx1AV00"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VALBUU2xZoGekyZWFY5Jl4XxZvxx1AV00
Content-Type: multipart/mixed; boundary="LgCIXgsASGHpxF5FKj00co6SpwxIaFuID";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Tim Gover <tim.gover@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org
Message-ID: <8c5f37b3-a4ff-d4d0-ebe0-8bc931416293@suse.de>
Subject: Re: [PATCH 6/8] drm/vc4: kms: Wait on previous FIFO users before a
 commit
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-7-maxime@cerno.tech>
In-Reply-To: <20201113152956.139663-7-maxime@cerno.tech>

--LgCIXgsASGHpxF5FKj00co6SpwxIaFuID
Content-Type: multipart/mixed;
 boundary="------------344EFE45A9C2EF20C7169572"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------344EFE45A9C2EF20C7169572
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.11.20 um 16:29 schrieb Maxime Ripard:
> If we're having two subsequent, non-blocking, commits on two different
> CRTCs that share no resources, there's no guarantee on the order of
> execution of both commits.

Can there only ever be two commits that flip order?

>=20
> However, the second one will consider the first one as the old state,
> and will be in charge of freeing it once that second commit is done.
>=20
> If the first commit happens after that second commit, it might access
> some resources related to its state that has been freed, resulting in a=

> use-after-free bug.
>=20
> The standard DRM objects are protected against this, but our HVS privat=
e
> state isn't so let's make sure we wait for all the previous FIFO users
> to finish their commit before going with our own.

I'd appreciate a comment in the code that explains a bit how this works. =

It's sort of clear to me, but not enough to fully get it.

>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 118 +++++++++++++++++++++++++++++++++=
-
>   1 file changed, 117 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> index 3034a5a6637e..849bc6b4cea4 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -40,6 +40,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct=
 drm_private_state *priv)
>   struct vc4_hvs_state {
>   	struct drm_private_state base;
>   	unsigned int unassigned_channels;
> +
> +	struct {
> +		unsigned in_use: 1;
> +		struct drm_crtc_commit *last_user;

Can these updates run concurrently? If so, the concurrency control via=20
in_use is dubious.

I find last_user to be confusing. Maybe pending_commit makes sense?


> +	} fifo_state[HVS_NUM_CHANNELS];
>   };
>  =20
>   static struct vc4_hvs_state *
> @@ -182,6 +187,32 @@ vc4_ctm_commit(struct vc4_dev *vc4, struct drm_ato=
mic_state *state)
>   		  VC4_SET_FIELD(ctm_state->fifo, SCALER_OLEDOFFS_DISPFIFO));
>   }
>  =20
> +static struct vc4_hvs_state *
> +vc4_hvs_get_new_global_state(struct drm_atomic_state *state)
> +{
> +	struct vc4_dev *vc4 =3D to_vc4_dev(state->dev);
> +	struct drm_private_state *priv_state;
> +
> +	priv_state =3D drm_atomic_get_new_private_obj_state(state, &vc4->hvs_=
channels);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_vc4_hvs_state(priv_state);
> +}
> +
> +static struct vc4_hvs_state *
> +vc4_hvs_get_old_global_state(struct drm_atomic_state *state)
> +{
> +	struct vc4_dev *vc4 =3D to_vc4_dev(state->dev);
> +	struct drm_private_state *priv_state;
> +
> +	priv_state =3D drm_atomic_get_old_private_obj_state(state, &vc4->hvs_=
channels);
> +	if (IS_ERR(priv_state))
> +		return ERR_CAST(priv_state);
> +
> +	return to_vc4_hvs_state(priv_state);
> +}
> +
>   static struct vc4_hvs_state *
>   vc4_hvs_get_global_state(struct drm_atomic_state *state)
>   {
> @@ -310,6 +341,7 @@ vc4_atomic_complete_commit(struct drm_atomic_state =
*state)
>   	struct vc4_hvs *hvs =3D vc4->hvs;
>   	struct drm_crtc_state *new_crtc_state;
>   	struct drm_crtc *crtc;
> +	struct vc4_hvs_state *old_hvs_state;
>   	int i;
>  =20
>   	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> @@ -329,6 +361,32 @@ vc4_atomic_complete_commit(struct drm_atomic_state=
 *state)
>  =20
>   	drm_atomic_helper_wait_for_dependencies(state);
>  =20
> +	old_hvs_state =3D vc4_hvs_get_old_global_state(state);
> +	if (!old_hvs_state)
> +		return;
> +
> +	for_each_old_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct vc4_crtc_state *vc4_crtc_state =3D
> +			to_vc4_crtc_state(crtc_state);
> +		unsigned int channel =3D
> +			vc4_crtc_state->assigned_channel;
> +
> +		if (channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
> +			continue;
> +
> +		if (!old_hvs_state->fifo_state[channel].in_use)
> +			continue;
> +
> +		commit =3D old_hvs_state->fifo_state[i].last_user;
> +		ret =3D wait_for_completion_timeout(&commit->hw_done, 10 * HZ);

For these returned values I'd use a separate variable, say 'complete' or =

'done'. It's an unsigned long and not the negative errno code that one=20
would expect in ret.

> +		if (!ret)
> +			DRM_DEV_ERROR(dev, "Timed out waiting for hw_done\n");

 From the comments in drm_print.h, I think drm_err() is preferred over=20
DRM_DEV_ERROR().

> +
> +		ret =3D wait_for_completion_timeout(&commit->flip_done, 10 * HZ);
> +		if (!ret)
> +			DRM_DEV_ERROR(dev, "Timed out waiting for flip_done\n");
> +	}
> +
>   	drm_atomic_helper_commit_modeset_disables(dev, state);
>  =20
>   	vc4_ctm_commit(vc4, state);
> @@ -368,6 +426,36 @@ static void commit_work(struct work_struct *work)
>   	vc4_atomic_complete_commit(state);
>   }
>  =20
> +static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct vc4_hvs_state *hvs_state;
> +	struct drm_crtc *crtc;
> +	unsigned int i;
> +
> +	hvs_state =3D vc4_hvs_get_new_global_state(state);
> +	if (!hvs_state)
> +		return -EINVAL;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct vc4_crtc_state *vc4_crtc_state =3D
> +			to_vc4_crtc_state(crtc_state);
> +		unsigned int channel =3D
> +			vc4_crtc_state->assigned_channel;
> +
> +		if (channel =3D=3D VC4_HVS_CHANNEL_DISABLED)
> +			continue;
> +
> +		if (!hvs_state->fifo_state[channel].in_use)
> +			continue;
> +
> +		hvs_state->fifo_state[channel].last_user =3D
> +			drm_crtc_commit_get(crtc_state->commit);
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * vc4_atomic_commit - commit validated state object
>    * @dev: DRM device
> @@ -697,6 +785,7 @@ vc4_hvs_channels_duplicate_state(struct drm_private=
_obj *obj)
>   {
>   	struct vc4_hvs_state *old_state =3D to_vc4_hvs_state(obj->state);
>   	struct vc4_hvs_state *state;
> +	unsigned int i;
>  =20
>   	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
>   	if (!state)
> @@ -706,6 +795,16 @@ vc4_hvs_channels_duplicate_state(struct drm_privat=
e_obj *obj)
>  =20
>   	state->unassigned_channels =3D old_state->unassigned_channels;
>  =20
> +	for (i =3D 0; i < HVS_NUM_CHANNELS; i++) {
> +		state->fifo_state[i].in_use =3D old_state->fifo_state[i].in_use;
> +
> +		if (!old_state->fifo_state[i].last_user)
> +			continue;
> +
> +		state->fifo_state[i].last_user =3D
> +			drm_crtc_commit_get(old_state->fifo_state[i].last_user);

A pure style issue: I'd avoid continue and instead write this as

if (old_state->fifo_state[i].last_user)
     state->fifo_state[i].last_user =3D drm_crtc_commit_get(...)

Here and in destroy_state.

> +	}
> +
>   	return &state->base;
>   }
>  =20
> @@ -713,6 +812,14 @@ static void vc4_hvs_channels_destroy_state(struct =
drm_private_obj *obj,
>   					   struct drm_private_state *state)
>   {
>   	struct vc4_hvs_state *hvs_state =3D to_vc4_hvs_state(state);
> +	unsigned int i;
> +
> +	for (i =3D 0; i < HVS_NUM_CHANNELS; i++) {
> +		if (!hvs_state->fifo_state[i].last_user)
> +			continue;
> +
> +		drm_crtc_commit_put(hvs_state->fifo_state[i].last_user);
> +	}
>  =20
>   	kfree(hvs_state);
>   }
> @@ -808,7 +915,10 @@ static int vc4_pv_muxing_atomic_check(struct drm_d=
evice *dev,
>  =20
>   		/* If we're disabling our CRTC, we put back our channel */
>   		if (old_crtc_state->enable && !new_crtc_state->enable) {
> -			hvs_state->unassigned_channels |=3D BIT(old_vc4_crtc_state->assigne=
d_channel);
> +			channel =3D old_vc4_crtc_state->assigned_channel;
> +
> +			hvs_state->unassigned_channels |=3D BIT(channel);
> +			hvs_state->fifo_state[channel].in_use =3D false;

It looks like in_use correlates with the bit in unassigned_channels.=20
Could you drop in_use entirely?

>   			new_vc4_crtc_state->assigned_channel =3D VC4_HVS_CHANNEL_DISABLED;=

>   			continue;
>   		}
> @@ -844,6 +954,7 @@ static int vc4_pv_muxing_atomic_check(struct drm_de=
vice *dev,
>   		channel =3D ffs(matching_channels) - 1;
>   		new_vc4_crtc_state->assigned_channel =3D channel;
>   		hvs_state->unassigned_channels &=3D ~BIT(channel);
> +		hvs_state->fifo_state[channel].in_use =3D true;
>   	}
>  =20
>   	return 0;
> @@ -869,6 +980,10 @@ vc4_atomic_check(struct drm_device *dev, struct dr=
m_atomic_state *state)
>   	return vc4_load_tracker_atomic_check(state);
>   }
>  =20
> +static struct drm_mode_config_helper_funcs vc4_mode_config_helpers =3D=
 {
> +	.atomic_commit_setup	=3D vc4_atomic_commit_setup,

OK, I assume we'll go with this callback.

Best regards
Thomas

> +};
> +
>   static const struct drm_mode_config_funcs vc4_mode_funcs =3D {
>   	.atomic_check =3D vc4_atomic_check,
>   	.atomic_commit =3D vc4_atomic_commit,
> @@ -912,6 +1027,7 @@ int vc4_kms_load(struct drm_device *dev)
>   	}
>  =20
>   	dev->mode_config.funcs =3D &vc4_mode_funcs;
> +	dev->mode_config.helper_private =3D &vc4_mode_config_helpers;
>   	dev->mode_config.preferred_depth =3D 24;
>   	dev->mode_config.async_page_flip =3D true;
>   	dev->mode_config.allow_fb_modifiers =3D true;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------344EFE45A9C2EF20C7169572
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

--------------344EFE45A9C2EF20C7169572--

--LgCIXgsASGHpxF5FKj00co6SpwxIaFuID--

--VALBUU2xZoGekyZWFY5Jl4XxZvxx1AV00
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+3wnEFAwAAAAAACgkQlh/E3EQov+Ce
mg/+IRXZmZbvRJVg+hLTfetiC7/SiISXekc85zHrzOSUKP6OT06jmLQSHrQDnWpynUI/XUgcQ/ll
2GNt0Os9aSDjA/f8TFJKaAlShxulnwwCJVmqj1f2uTYdWhU13eJbtJ7UQVo2Lx5FTATtedTlFuee
xpSMm40+nLg9JYp4WKVNad9Rf+7yY4kz6pNVoq1EG7xuElCrUYrW59tOpze1YNxTIpEU+ubi9qYD
pFzJLGLAkpcBMNNZ2Xjga/asBpPQ1UvwSn/HexftNIIYipwCJZSHtS/AECKW8PSXsZW+ijKIB4NA
2zqQ6VT1dhh7mF0qsSGDu2XI8Lcdqcy7gogCqRVCmyrUgG1LxkkKejQjn1oaQVcK1TRRyncC+rg1
wIxHLwh65vj3lDLZLSNE1Ez94p9PimWCvD2M5q1B0+5uwdL7IsZ7O4O2C3q1GDQUC7o0CkwXV/nH
6lQZ3uLuWcrjA1rxvNOvqQtH0uUxIj/gXyvapFZzJzmhQrj4JxWdVnxxfLMsJ0C7HEIQby9Ot9zZ
Ehh5Hj4EFN5uBprciPtljPJT6AViv2KXRqC4vMnOku9wNg0CXwAc6ocBplgcqNK5LvbKlbYIaU1C
PxDZzBZRnoniECtn1rfpNJjqTTBNOLDtEh6GO0i9dB/1k9bMUaEHetN9QIvg7J01Ax/QATm6dB0T
TJk=
=UQKq
-----END PGP SIGNATURE-----

--VALBUU2xZoGekyZWFY5Jl4XxZvxx1AV00--

--===============1771806381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1771806381==--
