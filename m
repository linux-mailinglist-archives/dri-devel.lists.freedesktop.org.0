Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42B57139C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22F59096E;
	Tue, 12 Jul 2022 07:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D879B90927
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 07:56:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id d12so12566013lfq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 00:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=+CIwsuAV60vv2H5mcRCvzEoBpWjyDkzRTUHpAMNHKl8=;
 b=giMF0xx3zDrhatPrEtIWcBySMT9nQ01rvriAcAxYXt44WFiYxJXqaQzhFXb6oWWwru
 l5FYgwqBRRnGyNbD2SQYfsIfaPJxA3iuNx18UiHQ5tW0YyuR+WOTIf+s1PCTPgD7iIiF
 HxjAofmmMtQLlIvmziqQBU740xcKVaQhfoEUPN3i/KU/vDmNfGKq2bic7wwy2waSFNfK
 A7Jtf1dKhcDtQv4ceceJWUNGaOdrFMAhDT72d94iW5ZJgzLqhIF6I29mbtAs1SQB7Qcw
 ISDUFMlGILh34gNUnQXlM8dhHEqqmYxhY7/iBeBkphYk7o9pnAI+aOept0I3TNo9OO7n
 70Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=+CIwsuAV60vv2H5mcRCvzEoBpWjyDkzRTUHpAMNHKl8=;
 b=sCdYnvVY/hBkfCKa0MGD0NzttU9n6+VX8Ed5YstOWxa0j0dPIGKfEkGhAt7a3ahsot
 8PEl5GpzBNwcdQSpoBcy7aD3+OAv2uC2p1/D5hzJ+My5mFFyxwwpGHRrAa77yy46HYJD
 Zes7iV68E+j40z2rCrF5uerRsHTu1Q3DKB0JlcBLlCsi0+TZ2ge1XJj28vS1AnCnR7ol
 pw2Qjp3e+J2YwDykENUTV4dWJVgnRS9DJMFGTUvDu/cPpkG3ttH+oGuOMvdiSHk5IT6w
 YIUb4hQZcZoyjymzErqSVhvg2G55Ly9JT0RRE10g1U9f/VDYg07F9RGZPG7DzJcAHjhi
 QK/A==
X-Gm-Message-State: AJIora9j7Oz6eZMJ90w7yNua//b33wQq162BbB/dLYd3oWet7HCGopP7
 DTSPLDYJidLDEK0FPs7PbnE=
X-Google-Smtp-Source: AGRyM1uFjhCCFyyWIoE5i7zZeSYL43qw37CI5GPxdTwNAU9STa9S7I/zRPB75rQdhPxEEtnerP6Oiw==
X-Received: by 2002:a05:6512:3186:b0:489:dd60:dbff with SMTP id
 i6-20020a056512318600b00489dd60dbffmr5815301lfe.686.1657612564170; 
 Tue, 12 Jul 2022 00:56:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056512118700b0047f647414efsm2036305lfr.190.2022.07.12.00.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 00:56:03 -0700 (PDT)
Date: Tue, 12 Jul 2022 10:56:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from
 cursor planes
Message-ID: <20220712105600.4a8592c1@eldfell>
In-Reply-To: <20220712033246.1148476-6-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-6-zack@kde.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SuNMSlzCGzQCrQqHN5Wxe7y";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/SuNMSlzCGzQCrQqHN5Wxe7y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Jul 2022 23:32:43 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Atomic modesetting got support for mouse hotspots via the hotspot
> properties. Port the legacy kms hotspot handling to the new properties
> on cursor planes.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vbox=
video/vbox_mode.c
> index fa0d73ce07bc..ca3134adb104 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -429,8 +429,8 @@ static void vbox_cursor_atomic_update(struct drm_plan=
e *plane,
>  	flags =3D VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>  		VBOX_MOUSE_POINTER_ALPHA;
>  	hgsmi_update_pointer_shape(vbox->guest_pool, flags,
> -				   min_t(u32, max(fb->hot_x, 0), width),
> -				   min_t(u32, max(fb->hot_y, 0), height),
> +				   min_t(u32, max(new_state->hotspot_x, 0), width),
> +				   min_t(u32, max(new_state->hotspot_y, 0), height),
>  				   width, height, vbox->cursor_data, data_size);
> =20
>  	mutex_unlock(&vbox->hw_mutex);

Hi,

this looks like silent clamping of the hotspot coordinates.

Should the DRM core perhaps already ensure that the hotspot must reside
inside the plane (fb) boundaries and reject the atomic (TEST_ONLY)
commit when it's outside?

Or if this restriction is not universal, maybe this driver should
reject invalid hotspots rather than silently mangle them?

Also, if supports_virtual_cursor_plane is false, should there not be
somewhere code that will ignore the values set to the atomic hotspot
properties?

When one KMS client switches to another, the first one being hotspot
aware and the latter not, and both atomic, then the latter KMS client
who doesn't know to drive the hotspot will inherit potentially invalid
hotspot from the previous KMS client. Does something prevent that from
being a problem?

The old KMS client may have left the virtual cursor plane visible, and
the new KMS client doesn't even know the virtual cursor plane exists
because it doesn't set the DRM client cap. Something should probably
ensure the virtual cursor plane gets disabled, right?


Thanks,
pq

--Sig_/SuNMSlzCGzQCrQqHN5Wxe7y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmLNKRAACgkQI1/ltBGq
qqf5qg//crowL4juaF98VmRTnn131YN7lkzvxsJ24XjV2EEbd6SQrD6Tgqebw30K
hW0t9/pLIzOF5r8cEEYcTagkqMRGbP8hUxAnAtlD9G2t60nrLfN/KcAXFY3xdH3O
WUmelCpnuWAWGLmnCdhFwK6OyRaS8buoNwXLHDZTUALDGsHDD1AH8QesTnvQDHh0
ePSWf3Obwea0pyxASEqUpSItKR4VJqikk2PYIeHKC0RPAX8iEZXgG7fwj1A1b85B
BOvvrJ8QbiLOgO080T3VTCgUNqzuhEe+1qKiORydzdpjkGDl7ql6xb913Dpnr6vo
MsqbjiWUNhidoH7aKurnf9reaPkp0V6wdl1XmelR0FU6wFP1RXZt9juZKaurHKvK
LaL2Qmx2P3mRNjxbKWNko7ux/qmDHXy+1+qZZXOSHt34HAgnwpk0k7ggCfn06AWo
H7NwPzjngoSNDVqCqVyxEyiBYfEiPvOWzMBYA46vNnWkgjauBcsuqvc8tBU13Bmb
BibY3FqzsCDygIZ8GZsAoVZwDfbfAnAjmaEz7hhapN76h1mC+Bq8cwk0QOMlmaCw
lZWTS2XfP+pC9OJeWzRjIJb6TmV2JSBD/djeclnayFpEqWJtTzZ6yZQHCrAGzoWZ
apsCxF/ryQzjsttJBux4SoEeIJD9PGb5dymy4NcG6xuXgkmGjf8=
=Na33
-----END PGP SIGNATURE-----

--Sig_/SuNMSlzCGzQCrQqHN5Wxe7y--
