Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592A13D51C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 08:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EBF6EC09;
	Thu, 16 Jan 2020 07:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBE76EC09
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 07:37:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 593D4AC2C;
 Thu, 16 Jan 2020 07:37:32 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
Date: Thu, 16 Jan 2020 08:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, xen-devel@lists.xenproject.org, emil.velikov@collabora.com,
 sean@poorly.run, laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============0878524504=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0878524504==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2TF20vE0nUR867IpaGkbOHeyuGZJOixI9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2TF20vE0nUR867IpaGkbOHeyuGZJOixI9
Content-Type: multipart/mixed; boundary="IhVePYMFhVozNgiM73xbi0VCK6gdDGe7Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@linux.ie, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, david@lechnology.com,
 noralf@tronnes.org, sean@poorly.run, oleksandr_andrushchenko@epam.com,
 sam@ravnborg.org, laurent.pinchart@ideasonboard.com,
 emil.velikov@collabora.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Message-ID: <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
In-Reply-To: <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>

--IhVePYMFhVozNgiM73xbi0VCK6gdDGe7Y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.01.20 um 07:41 schrieb Daniel Vetter:
> On Wed, Jan 15, 2020 at 01:52:26PM +0100, Thomas Zimmermann wrote:
>> In drm_atomic_helper_fake_vblank() the DRM core sends out VBLANK event=
s
>> if struct drm_crtc_state.no_vblank is enabled in the check() callbacks=
=2E
>>
>> For drivers that have neither an enable_vblank() callback nor a check(=
)
>> callback, the simple-KMS helpers enable VBLANK generation by default. =
This
>> simplifies bochs, udl, several tiny drivers, and drivers based upon MI=
PI
>> DPI helpers. The driver for Xen explicitly disables no_vblank, as it h=
as
>> its own logic for sending these events.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
>> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm=
/drm_simple_kms_helper.c
>> index 15fb516ae2d8..4414c7a5b2ce 100644
>> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
>> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
>> @@ -146,10 +146,21 @@ static int drm_simple_kms_plane_atomic_check(str=
uct drm_plane *plane,
>>  	if (!plane_state->visible)
>>  		return 0;
>> =20
>> -	if (!pipe->funcs || !pipe->funcs->check)
>> -		return 0;
>> -
>> -	return pipe->funcs->check(pipe, plane_state, crtc_state);
>> +	if (pipe->funcs) {
>> +		if (pipe->funcs->check)
>> +			return pipe->funcs->check(pipe, plane_state,
>> +						  crtc_state);
>> +		if (pipe->funcs->enable_vblank)
>> +			return 0;
>> +	}
>> +
>> +	/* Drivers without VBLANK support have to fake VBLANK events. As
>> +	 * there's no check() callback to enable this, set the no_vblank
>> +	 * field by default.
>> +	 */
>=20
> The ->check callback is right above this comment ... I'm confused.

I guess that comment isn't overly precise. What it means is that
no_vblank would have to be set in check(), but the driver did not
specify a check() function. So it has neither vblank support nor any way
of setting no_vblank. Hence, the simple-kms helper sets no_vblank
automatically.

Maybe something to update for the patchset's v2.

>=20
>> +	crtc_state->no_vblank =3D true;
>=20
> That's kinda not what I meant with handling this automatically. Instead=

> something like this:
>=20
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/dr=
m/drm_atomic_state_helper.c
> index 7cf3cf936547..23d2f51fc1d4 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(stru=
ct drm_crtc *crtc,
>  	/* Self refresh should be canceled when a new update is available */
>  	state->active =3D drm_atomic_crtc_effectively_active(state);
>  	state->self_refresh_active =3D false;
> +
> +	if (drm_dev_has_vblank(crtc->dev))
> +		state->no_vblank =3D true;
> +	else
> +		state->no_vblank =3D false;
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);

I think the if/else branches are in the wrong order.

But generally speaking, is it really that easy? The xen driver already
has to work around simple-kms's auto-enabling of no_vblank (see patch
4). Maybe this settings interferes with other drivers as well. At least
the calls for sending fake vblanks should be removed from all affected
drivers.

Best regards
Thomas

> =20
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.=
c
> index 1659b13b178c..32cab3d3c872 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -81,6 +81,12 @@
>   */
>  #define DRM_REDUNDANT_VBLIRQ_THRESH_NS 1000000
> =20
> +/* FIXME roll this out here in this file */
> +bool drm_dev_has_vblank(dev)
> +{
> +	return dev->num_crtcs;
> +}
> +
>  static bool
>  drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>  			  ktime_t *tvblank, bool in_vblank_irq);
>=20
>=20
> But maybe move the default value to some other/better place in the atom=
ic
> helpers, not sure what the best one is.
>=20
> Plus then in the documentation patch also highlight the link between
> crtc_state->no_vblank and drm_dev_has_vblank respectively
> drm_device.num_crtcs.
>=20
> That should plug this issue once for all across the board.
>=20
> There's still the fun between having the vblank callbacks and the
> drm_vblank setup, but that's a much older can of worms ...
> -Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--IhVePYMFhVozNgiM73xbi0VCK6gdDGe7Y--

--2TF20vE0nUR867IpaGkbOHeyuGZJOixI9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4gErkACgkQaA3BHVML
eiN+vwf/XGyl88sc5pspPvxnC5r6X3M2RF8oBoWhQ3pFbMkf4/UqJarP8N+G5M/+
yMVhwkYswAe9KdUZeqSwGLEdesukkyAQHPICSPXo17YrQl3HVAAqqv6P7zhGrNcU
l1P5ESbAVbxQf6P2nlLbJK6+lYPvp3ojLRloeLVXEO+MGR5hWtogc9p/vulWcDnu
8dEb0apW53GmMovVFhOr0haenOhzUc1wUb9zQm5mX/TDbpsJg8MBf7kKDcAMnPr1
/gM2EDjuW4BlRdrAQRTnpwcOFZe/bwXwZ8m9s6/jLAF4aP6LTsbgMzZxIGc0v/Ku
QZ5C5SSX3z4d1WSPYDhqIt600yNvVA==
=Xk4o
-----END PGP SIGNATURE-----

--2TF20vE0nUR867IpaGkbOHeyuGZJOixI9--

--===============0878524504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0878524504==--
