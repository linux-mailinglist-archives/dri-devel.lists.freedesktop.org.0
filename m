Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DAD4AFE4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 04:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9216E27E;
	Wed, 19 Jun 2019 02:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482236E27E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 02:13:04 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s22so9932191qkj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K5XTkXKQdVXT5qElZb9yJKrTukexv/N3eB+GX56hIKk=;
 b=ZfsjAk0yoOQ9fbNP7k8hxPO70LRKMCR+RZ5yBOeiHMN/4QPcUIKzFBA2iovszRZMkg
 BIlhKdel35419OurHN+rwlgkj1Y724ztaRbLJHfkjdsCuEhtmwdfLDoG/GEljLEtMUbM
 mRG38eIUFNCFh2IvCxAJO7sJXGJLUxv6MbdHnr/grFMD+tjmIzUESLKQdiMxf9R4Ydrp
 xpkwx/Jjmf+zOtU/xwO6c9qoI2CgWiR+ZiAqXJN5+2WXCRNcTNrcACFydqZoDhzvADE6
 CcMpZm9frETDg79R+UWZGFWIzG1vTxY6wEw8U98qJj0jrp6QV+FcUlvtLNuiPJGX/SdI
 gebw==
X-Gm-Message-State: APjAAAUmj2WCi0833yucncfxWcN5bXnp8y3xPyj/HwtaZrTKkJldSpPc
 DhgYObr9raljILtDg538ffw=
X-Google-Smtp-Source: APXvYqx/vcK1Yw2wEKXU/AmzAYnSw02mAlnW+kcnEyE4keZnNxYrIXBHs8Zqp+5kdPbHoHfBLx6enw==
X-Received: by 2002:a37:4c4e:: with SMTP id z75mr23299392qka.230.1560910383298; 
 Tue, 18 Jun 2019 19:13:03 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id k33sm9612289qte.69.2019.06.18.19.13.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 19:13:02 -0700 (PDT)
Date: Tue, 18 Jun 2019 23:12:58 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/10] drm/vkms: Move format arrays to vkms_plane.c
Message-ID: <20190619021258.s4l6nxofib2iqujv@smtp.gmail.com>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
 <20190606222751.32567-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190606222751.32567-5-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=K5XTkXKQdVXT5qElZb9yJKrTukexv/N3eB+GX56hIKk=;
 b=dHDl/yRqIt5dspaqla2XFmtp7QHr5r6MHl2Cqdno1KdNEehM9R0SkDPvRksa/e3tuS
 WDRZnIRAf7kWtQSp0R1D+L80pqksJZm+1A7xOgPAxsN/EJD4EXmO4GoxeuwEHsrqjbuU
 8xJvFDPR13Yo+/LP7jpd9VBDkTatC8uC30oJkQjGjbRyvXxQkmMt9tpcHPHFDxPOJI/s
 4cC5/wcjOc3yO3JLFyyatXDpLZFyygSDjECLps5afYHixncBjhgs/D+UXIwnk6WIFacj
 7sE9gEFNyyo+J6WnoaskULE4iW9PtUL/wmGs8x9l4eQu6kQzA8XJyjZ8DVsY8nxcKfCV
 zhEQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: multipart/mixed; boundary="===============0694191439=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0694191439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgbkumsvetbzxoyx"
Content-Disposition: inline


--xgbkumsvetbzxoyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/07, Daniel Vetter wrote:
> No need to have them multiple times.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h   | 8 --------
>  drivers/gpu/drm/vkms/vkms_plane.c | 8 ++++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 43d3f98289fe..2a35299bfb89 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -20,14 +20,6 @@
> =20
>  extern bool enable_cursor;
> =20
> -static const u32 vkms_formats[] =3D {
> -	DRM_FORMAT_XRGB8888,
> -};
> -
> -static const u32 vkms_cursor_formats[] =3D {
> -	DRM_FORMAT_ARGB8888,
> -};
> -
>  struct vkms_crc_data {
>  	struct drm_framebuffer fb;
>  	struct drm_rect src, dst;
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 0e67d2d42f0c..0fceb6258422 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -6,6 +6,14 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> =20
> +static const u32 vkms_formats[] =3D {
> +	DRM_FORMAT_XRGB8888,
> +};
> +
> +static const u32 vkms_cursor_formats[] =3D {
> +	DRM_FORMAT_ARGB8888,
> +};
> +
>  static struct drm_plane_state *
>  vkms_plane_duplicate_state(struct drm_plane *plane)
>  {
> --=20
> 2.20.1
>=20

Applied to the drm-misc-next branch.

Thanks.

--=20
Rodrigo Siqueira
https://siqueira.tech

--xgbkumsvetbzxoyx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0JmioACgkQWJzP/com
vP9p6RAAip9skZZc7b42V/0pjwruSJJVzcpCiyFXAcWs9VZHk3h58MnAPIBNgxNl
ICcpWe3/ZiIUtG22MNGdlA/sxXtQWJneBlBl7lUyY5UluJy0m+9F499RlqIFLui8
QmLfqVY+HhXzs5GN/pHLTOPkA8fg9CPmbGJsnUQr8vKLck4WnUwm3gDAlXB5A1ri
uM5omAEjwWl09a7D9Zx1a3fmq+bT6gY9al+reGtA9SekA0asepGWlTHI3yl3+YGi
viBJjKAVZzngmcO6e1p2NDq+3epeO3Cz5hlkpHvxW3SKwu/t6+I/OfcBcx14W7qk
DR7Oqh1ehjYr1COnOcVzajE/aeWOJyW+Aw7di+6vlwUZLjkEc5Kqj9KsuKxEop5n
Q540UxHx+m8ZLeRno7D/J9fpGsHotOGkaDNZkSx8vwYP/+7UlZl8So4nyV1DaFgh
j/RBY66blfRjhKZiKLR5fJeRRaGuniSyB/Nd/kyWMHoVp/E07L9Fla3VSbsiOU9T
ItL5ck8fnGIDVKIhTEwrjUeRBkqo4sxAflpLmY0iIBy1FDaU8a3odXNAbDZljuN+
ROMyt88Zyz408W9Ay89w0FkeuH7k+oBw5DuubJwfN2ywJWKQdH4aELYLf4LD26sb
IAOXKC0KWgBrqHbfHfx2rB6jqNUHXCR/ndo3k1xmy7C7FLQ4y3E=
=LGJH
-----END PGP SIGNATURE-----

--xgbkumsvetbzxoyx--

--===============0694191439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0694191439==--
