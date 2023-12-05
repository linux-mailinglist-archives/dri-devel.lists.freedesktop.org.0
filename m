Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FD804CF2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE1410E4AF;
	Tue,  5 Dec 2023 08:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBE410E4BB
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:51:11 +0000 (UTC)
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 410FA6601659;
 Tue,  5 Dec 2023 08:51:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701766270;
 bh=wu4yeeycz2M2O0W+tOjcoUNWYsPK6GEuZ3vwH8VUxgM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bWMCbNe34+JuduYxXeDavvd0fBh4B4BEQMLMugAAjlBwrTMgGVkHoRmKngGoVk1Tq
 vJZZMvmA8n+yVQcjLwPqUByyW13qKKZ1QsOZqTE9sGLBR2NPudoJvqJkpD8h1ykvgL
 PiQ4fxKVpFF8/nD0Ati17iOa0V5/qyg2FMSsB4Cm/BrshP+Dw4D4S61hWWBXHZesfZ
 4LBcsS15gQXOxM8nhPMxWNa5KN89jzkmDtKr9yW58+W57kDOCCgNaxsrXwaYECX91U
 ZSPRDNqndb0xs9CWIcNF1xpkWDGEmdYculJsBmc5a6wmTqAOMR2jnFtX9HyxZcgLKf
 C/7JBH1ACw9tw==
Date: Tue, 5 Dec 2023 10:51:06 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 4/5] drm/atomic: Make the drm_atomic_state documentation
 less ambiguous
Message-ID: <20231205105106.06a34b81.pekka.paalanen@collabora.com>
In-Reply-To: <20231204121707.3647961-4-mripard@kernel.org>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-4-mripard@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZuC1.BOt8b7DFRVahf+RP_6";
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ZuC1.BOt8b7DFRVahf+RP_6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Dec 2023 13:17:06 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> The current documentation of drm_atomic_state says that it's the "global
> state object". This is confusing since, while it does contain all the
> objects affected by an update and their respective states, if an object
> isn't affected by this update it won't be part of it.
>=20
> Thus, it's not truly a "global state", unlike object state structures
> that do contain the entire state of a given object.
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  include/drm/drm_atomic.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 914574b58ae7..81ad7369b90d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -346,11 +346,19 @@ struct __drm_private_objs_state {
>  };
> =20
>  /**
> - * struct drm_atomic_state - the global state object for atomic updates
> + * struct drm_atomic_state - Atomic Update structure
> + *
> + * This structure is the kernel counterpart of @drm_mode_atomic and cont=
ains
> + * all the objects affected by an atomic modeset update and their states.

Drop "modeset"? An update can be without a modeset.

>   *
>   * States are added to an atomic update by calling drm_atomic_get_crtc_s=
tate(),
>   * drm_atomic_get_plane_state(), drm_atomic_get_connector_state(), or for
>   * private state structures, drm_atomic_get_private_obj_state().
> + *
> + * NOTE: While this structure looks to be global and affecting the whole=
 DRM
> + * device, it only contains the objects affected by the atomic commit.

This new phrasing is much more clear to me than the old one.

> + * Unaffected objects will not be part of that update, unless they have =
been
> + * explicitly added by either the framework or the driver.

If the framework or a driver adds an object, then it's no longer
unaffected, is it?

Should there be some discussion how this struct starts with only what
userspace mentioned, and more affected objects may be added by the
framework or a driver? And adding more objects can surprise the
userspace and cause even failures (e.g. random, hard-to-diagnose EBUSY
errors from atomic commit when a driver added a CRTC that was not
supposed to be affected)? Even unexpected failures on *future* atomic
commits, as in the CRTC example.

Was there actually a rule of when the kernel can add unmentioned
objects, like needing ALLOW_MODESET from userspace?

It's fine to leave those details for later if you want.

>   */
>  struct drm_atomic_state {
>  	/**


Thanks,
pq

--Sig_/ZuC1.BOt8b7DFRVahf+RP_6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmVu5HoACgkQI1/ltBGq
qqfHug/+P+nMUwv6gGUmFJcu4DIe7N3JozcudOGhgy0hj4P61MXV9EBrIOKM/5Dw
L4c4p6dL5ztYktfDSV5BZO7OAdVwbj9sQ8tUiWpdR36/X4Wqs6I5r0cu4xdYJVLN
iZrBkhJxKoeaHCdyhPrA2UXJwPayhcPYyjcqap0y3H5laSkn1Kbvh+6/N8VE+JCv
KDjzLt0ggKUwF+ghdXzCSA4yIpME7WybfdowPZ2hMAiERtSwSCkCK/PxuPnDfaKi
ETEPk/Zw414JcTAeYwgzRTTLCdvEkGA8wWUUo5cSHbfTXhKm+IQzLgUZCh0K8chz
mJaBQfGIi2GPvt6XWLUluaRRFGqAx6qq+UM8WNtdtVqgHh6+irslLjikxywIYTKH
w5Z3FxqjN+lt1D1QMECwY/tp1lSVkVWS6U7kInp9Ak6ljWLtmEE/s5qXHQI00xOo
3bbIW3iPNdJdBHT/JyyMyx7OLkqcBi6MQdvKN56t/Gy7+YLk2RZZAe/b92g5XVAt
dRMly+D6OTZh/zl66SuMGTtYmCTdZV9aCjF+DXYtwOzSvYFSxO2jAuKT6mgSjete
PoM+OxF6812MQKxyvy5sHetVE5UT98aFpuW7woCT83IE8x2GMHXuBIFgkAeivpng
CmgdKJlBC+zd1TC+9thXv9UF6JeIiE28J1rYrvPOi8wOLydO1gM=
=nKwU
-----END PGP SIGNATURE-----

--Sig_/ZuC1.BOt8b7DFRVahf+RP_6--
