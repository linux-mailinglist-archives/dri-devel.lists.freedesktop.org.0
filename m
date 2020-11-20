Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC302BABA2
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 15:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E186E8BC;
	Fri, 20 Nov 2020 14:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A86E8BB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:08:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBC99B004;
 Fri, 20 Nov 2020 14:08:40 +0000 (UTC)
Subject: Re: [PATCH 8/8] drm/vc4: kms: Convert to atomic helpers
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Eric Anholt <eric@anholt.net>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-9-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <71b02ee8-72a5-1790-0546-65213031ebc2@suse.de>
Date: Fri, 20 Nov 2020 15:08:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113152956.139663-9-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1397628382=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1397628382==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7ZYVUkYMR7W1tAf6W5z3rMonR3d5rh5rO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7ZYVUkYMR7W1tAf6W5z3rMonR3d5rh5rO
Content-Type: multipart/mixed; boundary="K5COaBdT2rW2zZrkFKkzTz1JrqkxkYJLG";
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
Message-ID: <71b02ee8-72a5-1790-0546-65213031ebc2@suse.de>
Subject: Re: [PATCH 8/8] drm/vc4: kms: Convert to atomic helpers
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-9-maxime@cerno.tech>
In-Reply-To: <20201113152956.139663-9-maxime@cerno.tech>

--K5COaBdT2rW2zZrkFKkzTz1JrqkxkYJLG
Content-Type: multipart/mixed;
 boundary="------------ED33B7EF027448178C549253"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ED33B7EF027448178C549253
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Am 13.11.20 um 16:29 schrieb Maxime Ripard:
> Now that the semaphore is gone, our atomic_commit implementation is
> basically drm_atomic_helper_commit with a somewhat custom commit_tail,
> the main difference being that we're using wait_for_flip_done instead o=
f
> wait_for_vblanks used in the drm_atomic_helper_commit_tail helper.
>=20
> Let's switch to using drm_atomic_helper_commit.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 112 +--------------------------------=
-
>   1 file changed, 3 insertions(+), 109 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> index 79ab7b8a5e0e..ede5d2b6ac65 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -333,8 +333,7 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev=
 *vc4,
>   	}
>   }
>  =20
> -static void
> -vc4_atomic_complete_commit(struct drm_atomic_state *state)
> +static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>   {
>   	struct drm_device *dev =3D state->dev;
>   	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> @@ -357,10 +356,6 @@ vc4_atomic_complete_commit(struct drm_atomic_state=
 *state)
>   	if (vc4->hvs->hvs5)
>   		clk_set_min_rate(hvs->core_clk, 500000000);
>  =20
> -	drm_atomic_helper_wait_for_fences(dev, state, false);
> -
> -	drm_atomic_helper_wait_for_dependencies(state);
> -
>   	old_hvs_state =3D vc4_hvs_get_old_global_state(state);
>   	if (!old_hvs_state)
>   		return;
> @@ -408,20 +403,8 @@ vc4_atomic_complete_commit(struct drm_atomic_state=
 *state)
>  =20
>   	drm_atomic_helper_cleanup_planes(dev, state);
>  =20
> -	drm_atomic_helper_commit_cleanup_done(state);
> -
>   	if (vc4->hvs->hvs5)
>   		clk_set_min_rate(hvs->core_clk, 0);
> -
> -	drm_atomic_state_put(state);
> -}
> -
> -static void commit_work(struct work_struct *work)
> -{
> -	struct drm_atomic_state *state =3D container_of(work,
> -						      struct drm_atomic_state,
> -						      commit_work);
> -	vc4_atomic_complete_commit(state);
>   }
>  =20
>   static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
> @@ -454,96 +437,6 @@ static int vc4_atomic_commit_setup(struct drm_atom=
ic_state *state)
>   	return 0;
>   }
>  =20
> -/**
> - * vc4_atomic_commit - commit validated state object
> - * @dev: DRM device
> - * @state: the driver state object
> - * @nonblock: nonblocking commit
> - *
> - * This function commits a with drm_atomic_helper_check() pre-validate=
d state
> - * object. This can still fail when e.g. the framebuffer reservation f=
ails. For
> - * now this doesn't implement asynchronous commits.
> - *
> - * RETURNS
> - * Zero for success or -errno.
> - */
> -static int vc4_atomic_commit(struct drm_device *dev,
> -			     struct drm_atomic_state *state,
> -			     bool nonblock)
> -{
> -	int ret;
> -
> -	if (state->async_update) {
> -		ret =3D drm_atomic_helper_prepare_planes(dev, state);
> -		if (ret) {
> -			up(&vc4->async_modeset);
> -			return ret;
> -		}
> -
> -		drm_atomic_helper_async_commit(dev, state);
> -
> -		drm_atomic_helper_cleanup_planes(dev, state);
> -
> -		return 0;
> -	}
> -
> -	/* We know for sure we don't want an async update here. Set
> -	 * state->legacy_cursor_update to false to prevent
> -	 * drm_atomic_helper_setup_commit() from auto-completing
> -	 * commit->flip_done.
> -	 */
> -	state->legacy_cursor_update =3D false;
> -	ret =3D drm_atomic_helper_setup_commit(state, nonblock);
> -	if (ret)
> -		return ret;
> -
> -	INIT_WORK(&state->commit_work, commit_work);
> -
> -	ret =3D drm_atomic_helper_prepare_planes(dev, state);
> -	if (ret)
> -		return ret;
> -
> -	if (!nonblock) {
> -		ret =3D drm_atomic_helper_wait_for_fences(dev, state, true);
> -		if (ret) {
> -			drm_atomic_helper_cleanup_planes(dev, state);
> -			return ret;
> -		}
> -	}
> -
> -	/*
> -	 * This is the point of no return - everything below never fails exce=
pt
> -	 * when the hw goes bonghits. Which means we can commit the new state=
 on
> -	 * the software side now.
> -	 */
> -
> -	BUG_ON(drm_atomic_helper_swap_state(state, false) < 0);
> -
> -	/*
> -	 * Everything below can be run asynchronously without the need to gra=
b
> -	 * any modeset locks at all under one condition: It must be guarantee=
d
> -	 * that the asynchronous work has either been cancelled (if the drive=
r
> -	 * supports it, which at least requires that the framebuffers get
> -	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
> -	 * before the new state gets committed on the software side with
> -	 * drm_atomic_helper_swap_state().
> -	 *
> -	 * This scheme allows new atomic state updates to be prepared and
> -	 * checked in parallel to the asynchronous completion of the previous=

> -	 * update. Which is important since compositors need to figure out th=
e
> -	 * composition of the next frame right after having submitted the
> -	 * current layout.
> -	 */
> -
> -	drm_atomic_state_get(state);
> -	if (nonblock)
> -		queue_work(system_unbound_wq, &state->commit_work);
> -	else
> -		vc4_atomic_complete_commit(state);
> -
> -	return 0;
> -}
> -
>   static struct drm_framebuffer *vc4_fb_create(struct drm_device *dev,
>   					     struct drm_file *file_priv,
>   					     const struct drm_mode_fb_cmd2 *mode_cmd)
> @@ -966,11 +859,12 @@ vc4_atomic_check(struct drm_device *dev, struct d=
rm_atomic_state *state)
>  =20
>   static struct drm_mode_config_helper_funcs vc4_mode_config_helpers =3D=
 {
>   	.atomic_commit_setup	=3D vc4_atomic_commit_setup,
> +	.atomic_commit_tail	=3D vc4_atomic_commit_tail,
>   };
>  =20
>   static const struct drm_mode_config_funcs vc4_mode_funcs =3D {
>   	.atomic_check =3D vc4_atomic_check,
> -	.atomic_commit =3D vc4_atomic_commit,
> +	.atomic_commit =3D drm_atomic_helper_commit,
>   	.fb_create =3D vc4_fb_create,
>   };
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------ED33B7EF027448178C549253
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

--------------ED33B7EF027448178C549253--

--K5COaBdT2rW2zZrkFKkzTz1JrqkxkYJLG--

--7ZYVUkYMR7W1tAf6W5z3rMonR3d5rh5rO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+3zeQFAwAAAAAACgkQlh/E3EQov+D+
HQ//aCkjPt2DQWwEkUyc82k/fwzLAkkUg3UImaZG/t+3alImLN7VY+8XlQTR5vSpaJKvwLVK7lQC
Hmb2dp+mblzQ5ZYCva9/DMWQgkQKos1NP+wu83/BdGQxyZbPLCvUMOjsL+0YqJSJmcwHPBLrBuGr
lcmQUA/SD9siXeAqGUZgdXDVRE+n/3DLSow8O4eutsy+sj8vI5gPn+AwlxNLpTJqCUrRYDMMeaJ2
+KlLWekDKuNAi53v1ud6f5+8qXNw0D9+HK9c7oq3Ky/6l0me3R+Su7aypp2M9ZyWs65+pfrxiIPK
i1I9WAeiJ7Aw+CKfDJlu9RbeH0htsbJpeei1a8g6gfSdNS+H/2wP0g2qCSm4YKnVFeJCXiiyiMgZ
qJmZ+P3VF0V4XJrxqNU7wQv/wsYqO+sRPJE+7RSejUoCyIGAQMo0XOfoj4WQbOPa/D7Yt2OrLiLX
yPa85nLDl8mF6jE3CoH+rFv6h6cMnbkMozPT+sAnRE60ODMsIh1eQXIUhog/nNvM7deLqdMpjPCf
/OET7t8oKeRUkf3tBqklpzMSfUACc7vFm/cRFt7ks6cxjvW3K6Gkn8RNvfZW0KysXjjtIukpaUF/
najxSJu/Wiq2tok0rTcH94lcloiOghSQ8qEhDLHxYocdDL1mLOY+nriNUSdEh7Cea4vI+xuv04eu
9Uw=
=O/23
-----END PGP SIGNATURE-----

--7ZYVUkYMR7W1tAf6W5z3rMonR3d5rh5rO--

--===============1397628382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1397628382==--
