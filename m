Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A641B0B3F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 14:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB42E6E53C;
	Mon, 20 Apr 2020 12:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF136E53C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:55:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6AFBABD7;
 Mon, 20 Apr 2020 12:55:02 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Allocate initial CRTC state of the correct size
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <158738670022.7365.11535132795669408878.stgit@buzz>
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
Message-ID: <30efe6f4-3d2f-f147-0801-9f727f797725@suse.de>
Date: Mon, 20 Apr 2020 14:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158738670022.7365.11535132795669408878.stgit@buzz>
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
Content-Type: multipart/mixed; boundary="===============1156889468=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1156889468==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CfLByMvnxzMTt4iBjOCXLouIM6LFBxzTd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CfLByMvnxzMTt4iBjOCXLouIM6LFBxzTd
Content-Type: multipart/mixed; boundary="08uudnVc8lBSAPyNyplRhaqj6HZovQXRy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Message-ID: <30efe6f4-3d2f-f147-0801-9f727f797725@suse.de>
Subject: Re: [PATCH] drm/ast: Allocate initial CRTC state of the correct size
References: <158738670022.7365.11535132795669408878.stgit@buzz>
In-Reply-To: <158738670022.7365.11535132795669408878.stgit@buzz>

--08uudnVc8lBSAPyNyplRhaqj6HZovQXRy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Konstantin

Am 20.04.20 um 14:45 schrieb Konstantin Khlebnikov:
> I've stumbled upon this too. Trivial fix was posted but stuck in review=
=2E
> This is patch from Thomas Zimmermann changed according to suggestions b=
y
> Daniel Vetter from https://patchwork.kernel.org/patch/11356157/

Did you find it on the mailing list? I was waiting for this patch to get
merged. Apparently I forgot to push it? I'll take care of the patch.

Best regards
Thomas

>=20
>=20
> The ast driver inherits from DRM's CRTC state, but still uses the atomi=
c
> helper for struct drm_crtc_funcs.reset, drm_atomic_helper_crtc_reset().=

>=20
> The helper only allocates enough memory for the core CRTC state. That
> results in an out-ouf-bounds access when duplicating the initial CRTC
> state. Simplified backtrace shown below:
>=20
> [   21.469321] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   21.469434] BUG: KASAN: slab-out-of-bounds in ast_crtc_atomic_duplic=
ate_state+0x84/0x100 [ast]
> [   21.469445] Read of size 8 at addr ffff888036c1c5f8 by task systemd-=
udevd/382
> [   21.469451]
> [   21.469464] CPU: 2 PID: 382 Comm: systemd-udevd Tainted: G          =
  E     5.5.0-rc6-1-default+ #214
> [   21.469473] Hardware name: Sun Microsystems SUN FIRE X2270 M2/SUN FI=
RE X2270 M2, BIOS 2.05    07/01/2010
> [   21.469480] Call Trace:
> [   21.469501]  dump_stack+0xb8/0x110
> [   21.469528]  print_address_description.constprop.0+0x1b/0x1e0
> [   21.469557]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
> [   21.469581]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
> [   21.469597]  __kasan_report.cold+0x1a/0x35
> [   21.469640]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
> [   21.469665]  kasan_report+0xe/0x20
> [   21.469693]  ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
> [   21.469733]  drm_atomic_get_crtc_state+0xbf/0x1c0
> [   21.469768]  __drm_atomic_helper_set_config+0x81/0x5a0
> [   21.469803]  ? drm_atomic_plane_check+0x690/0x690
> [   21.469843]  ? drm_client_rotation+0xae/0x240
> [   21.469876]  drm_client_modeset_commit_atomic+0x230/0x390
> [   21.469888]  ? __mutex_lock+0x8f0/0xbe0
> [   21.469929]  ? drm_client_firmware_config.isra.0+0xa60/0xa60
> [   21.469948]  ? drm_client_modeset_commit_force+0x28/0x230
> [   21.470031]  ? memset+0x20/0x40
> [   21.470078]  drm_client_modeset_commit_force+0x90/0x230
> [   21.470110]  drm_fb_helper_restore_fbdev_mode_unlocked+0x5f/0xc0
> [   21.470132]  drm_fb_helper_set_par+0x59/0x70
> [   21.470155]  fbcon_init+0x61d/0xad0
> [   21.470185]  ? drm_fb_helper_restore_fbdev_mode_unlocked+0xc0/0xc0
> [   21.470232]  visual_init+0x187/0x240
> [   21.470266]  do_bind_con_driver+0x2e3/0x460
> [   21.470321]  do_take_over_console+0x20a/0x290
> [   21.470371]  do_fbcon_takeover+0x85/0x100
> [   21.470402]  register_framebuffer+0x2fd/0x490
> [   21.470425]  ? kzalloc.constprop.0+0x10/0x10
> [   21.470503]  __drm_fb_helper_initial_config_and_unlock+0xf2/0x140
> [   21.470533]  drm_fbdev_client_hotplug+0x162/0x250
> [   21.470563]  drm_fbdev_generic_setup+0xd2/0x155
> [   21.470602]  ast_driver_load+0x688/0x850 [ast]
> <...>
> [   21.472625] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Allocating enough memory for struct ast_crtc_state in a custom ast CRTC=

> reset handler fixes the problem.
>=20
> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
> Fixes: 83be6a3ceb11 ("drm/ast: Introduce struct ast_crtc_state")
> Link: https://patchwork.kernel.org/patch/11356157/
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/ast/ast_mode.c |   13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index cdd6c46d6557..17143e6bbfec 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -918,8 +918,19 @@ static void ast_crtc_atomic_destroy_state(struct d=
rm_crtc *crtc,
>  	kfree(ast_state);
>  }
> =20
> +static void ast_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct ast_crtc_state *state =3D
> +		kzalloc(sizeof(*state), GFP_KERNEL);
> +
> +	if (crtc->state)
> +		ast_crtc_atomic_destroy_state(crtc, crtc->state);
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +}
> +
>  static const struct drm_crtc_funcs ast_crtc_funcs =3D {
> -	.reset =3D drm_atomic_helper_crtc_reset,
> +	.reset =3D ast_crtc_reset,
>  	.set_config =3D drm_crtc_helper_set_config,
>  	.gamma_set =3D drm_atomic_helper_legacy_gamma_set,
>  	.destroy =3D ast_crtc_destroy,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--08uudnVc8lBSAPyNyplRhaqj6HZovQXRy--

--CfLByMvnxzMTt4iBjOCXLouIM6LFBxzTd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6dm6UACgkQaA3BHVML
eiNM3Qf/bEWMc4N63MVva0S12ctSsesP0Xdm92KDH0Ca2/agd6PJBkgGSO6Qasu+
Nrnl7JjFi9MQfds3YW/khB79ovV0bPyi6rMEXvsvUUM/bpgl87UwmpsBj5Z+tUgk
8FTuE5off7/uc2ov3qSu5r9vHMAcgr/s8DR85PiILBU6aTN8SiQaijLqE0c0WbBX
WR4diyotIh8z2zdswbbp3GMsXt4jZSWPQJJE+LwJU0/ttH0jbIp12jOd4X9mE01k
pxLdS+WlUL2cHqp4shwn0JHiNQ0i5/yM8NJPzPSZPQQ1qcZo5WJJ9EJGIdgyCvT8
Aa5r5RtHtb+DaKTQ+em4XrR8o+Skag==
=2UOX
-----END PGP SIGNATURE-----

--CfLByMvnxzMTt4iBjOCXLouIM6LFBxzTd--

--===============1156889468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1156889468==--
