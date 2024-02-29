Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F39C86C960
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B966F10E266;
	Thu, 29 Feb 2024 12:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DgavKIbQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F0C10E05E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709210500;
 bh=bYwenActmo0DJIFiEmMoeGrYokDOzONoZ2KvaEqH3jQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DgavKIbQIDwous2datEXLvFLQIqT8gkwH/KHbsvYsyazEvx1ex1CjAm0/yY63TT8z
 t3ThwFpUZ+QR+PwwV6rQgMGdhfnSirsMjJVRP54VSIwnle5jGcPFCqJqCz9WRDiEGm
 jMsAhLPLVYomlaB04GzQWI6Q+iXF906z9tLBMqYbk/Tjs00O58DtwUTznnyddBNtgr
 OfoRd0UgS4HTEmAX1cJpkpmScQ1oq3va+vMwoduScnNq5ww0iSkXy3a5mtTWaxTaDD
 MaHDdwKMlonV2Xe7YzWVs81i/peEZylWjis9Pn7u/9lCC2kWjbH7nevGAWWbLVW6ns
 SEVJPKlHwvWLQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF34F3782089;
 Thu, 29 Feb 2024 12:41:38 +0000 (UTC)
Date: Thu, 29 Feb 2024 14:41:37 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v3 3/9] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Message-ID: <20240229144137.75ae1cde.pekka.paalanen@collabora.com>
In-Reply-To: <592e5da7-7aac-4735-ae8f-625402e381ae@riseup.net>
References: <20240226-yuv-v3-0-ff662f0994db@bootlin.com>
 <20240226-yuv-v3-3-ff662f0994db@bootlin.com>
 <406988be-48a4-4762-9c03-7a27c8e7b91e@riseup.net>
 <Zd35csjqRMstzElA@localhost.localdomain>
 <592e5da7-7aac-4735-ae8f-625402e381ae@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ppy=jx7+zAsqz9DWBleezt6";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ppy=jx7+zAsqz9DWBleezt6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 15:47:08 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 27/02/24 12:02, Louis Chauvet wrote:
> > Le 26/02/24 - 10:07, Arthur Grillo a =C3=A9crit : =20
> >>
> >>
> >> On 26/02/24 05:46, Louis Chauvet wrote: =20
> >>> Add some documentation on pixel conversion functions.
> >>> Update of outdated comments for pixel_write functions.
> >>>
> >>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >>> ---
> >>>  drivers/gpu/drm/vkms/vkms_composer.c |  4 +++
> >>>  drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
> >>>  drivers/gpu/drm/vkms/vkms_formats.c  | 58 ++++++++++++++++++++++++++=
++++------
> >>>  3 files changed, 66 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/v=
kms/vkms_composer.c
> >>> index c6d9b4a65809..5b341222d239 100644
> >>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >>> @@ -189,6 +189,10 @@ static void blend(struct vkms_writeback_job *wb,
> >>> =20
> >>>  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> >>> =20
> >>> +	/*
> >>> +	 * The planes are composed line-by-line. It is a necessary complexi=
ty to avoid poor
> >>> +	 * blending performance. =20
> >>
> >> At this moment in the series, you have not yet reintroduced the
> >> line-by-line algorithm yet. Maybe it's better to add this comment when
> >> you do. =20
> >=20
> > Is it better with this:
> >=20
> > 	/*
> > 	 * The planes are composed line-by-line to avoid heavy memory usage. I=
t is a necessary
> > 	 * complexity to avoid poor blending performance.
> > 	 *
> > 	 * The function vkms_compose_row is used to read a line, pixel-by-pixe=
l, into the staging
> > 	 * buffer.
> > 	 */
> >   =20
> >> Also, I think it's good to give more context, like:
> >> "The planes are composed line-by-line, instead of pixel-by-pixel" =20
> >=20
> > And after PATCHv3 5/9:
> >=20
> > 	/*
> > 	 * The planes are composed line-by-line to avoid heavy memory usage. I=
t is a necessary
> > 	 * complexity to avoid poor blending performance.
> > 	 *
> > 	 * The function pixel_read_line callback is used to read a line, using=
 an efficient=20
> > 	 * algorithm for a specific format, into the staging buffer.
> > 	 */
> >  =20

Hi,

there are a few reasons for the line-by-line algorithm, and the
optimizations at large:

VKMS uses temporary stage and output buffers so that blending functions
can operate on just one high-precision pixel format, struct
pixel_argb_u16. We can make pixel-format-specific read and write
functions completely orthogonal from the blending operations and FB
format combinations. This avoids a combinatorial explosion of needed
functions for { input pixel formats =C3=97 blending operations =C3=97 outpu=
t pixel
formats }.

We can use a temporary stage and output buffer whose size is one line
and not whole FB or CRTC framebuffer. This is the memory savings.

Using a temporary output buffer also avoids repeated
read-decode-blend-encode-write cycles into the final destination
buffer, as we don't need to decode/encode the pixel format.

Finally, doing elementary operations (read, blend, write) line-by-line
is much more efficient than pixel-by-pixel, because it allows making
the inner-most loop very tight. It avoids repeatedly computing a result
that does not change, like which function to call for a specific pixel
format or blending equation.


Thanks,
pq

--Sig_/ppy=jx7+zAsqz9DWBleezt6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXge4EACgkQI1/ltBGq
qqekCA/9H2SBK6/zbiLJ1s9dhN6MeJPRfUQqtWLebfifxniKaSJuXOLHG2j6qemx
zo6q6QAHexA+eD4oXWxpbVAzlmfpgxaiMxrQeTeG1ZrwJxbHZgpHO5PeplhIlLfF
5w9uB0gjCn7SLyWABo7i0WIuj/GI7Sfgf+uhiOYbyEZLQzTs5Ob+whVt0CDGQUXq
0TUhaXz0N/L/HlepprYdfRBF8UIIXoz90ASRgyPLHbzfjH18UqjvgY+y4O3nv2Fb
jzvTLHJ4OwsSfNymDDGTeQBAFif+8B3KGt6bgsJLi7D+HxlOArAcQQtRjUC/GQYc
ia2JXmD6ywS6h7+3NDZVEGqS5goSidPDXP+sZv+bH8j+7rF4OXCcubOe0pnzN50g
OVlACtxWptXWlDebJLDyALk79C0RpcGkC+dhoNscjDSe8lsm++4eO6FxY85ikCGt
x4KiemghnhkZxh24DPFjX6chGBvxuIIWf3Ku0iTj1HHinzkOCPxsoaRiIz8w6XtK
VMFQRn5avEigcYTo4C8icSCpkGvJPt9XDEyZwWqX4uiVhFFrjd9ObP9evGoyi2fv
NTIwy90iReIu6OMSwiiFa2kvVwTbGqsqKTpGpPlNPyF0aZnaN6nYz5Vz8JYPtNO3
aHV+H77b8GX1wcdTAwXdANwVCbQm72Fuq6m28tClX8DNNiwvPZY=
=Vbxy
-----END PGP SIGNATURE-----

--Sig_/ppy=jx7+zAsqz9DWBleezt6--
