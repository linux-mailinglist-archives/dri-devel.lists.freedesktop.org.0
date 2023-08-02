Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AAA76C412
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 06:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA6210E490;
	Wed,  2 Aug 2023 04:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD1D10E490
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 04:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1690950098;
 bh=ytTzxjT9vf+qopNiuLBYKW6ydrwJGNWZZ6Ruz09thxQ=;
 h=Date:From:To:Cc:Subject:From;
 b=GQdU8s+d7Sq8evVo33NXW6Jx6nuVQEjrLjld9OXk4NLl1v9HteJg0ECjqXkjAZZAo
 QT2Hk59HvFCIysY47XhMlv11+Rt9xxVeufEgngwmu4lUCE2cQOQwoP3z8xWP8zowXr
 o7JAmOhVIbCArDT6Ptplz7E0T6ToyM4amMOaJQTDQKc2KQ6TXVvgMq7t79ZJrXhn5O
 hz1jc4t+edOo+M/kQI9HtEUefOYaK74jfnChH/VLXbsiuI7xPORuZn5yopCYmLuYDe
 20ZIzALjKCrK+VKks+wPj9+wwnu5H1/CniJ9uuhdn6/4Y/0sFBfnoi5kdEY308ENat
 yJFP51+43eZUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RFzM60zTNz4yMK;
 Wed,  2 Aug 2023 14:21:38 +1000 (AEST)
Date: Wed, 2 Aug 2023 14:21:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20230802142136.0f67b762@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rfB=1CgUJuio3xNdF5E4QJD";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/rfB=1CgUJuio3xNdF5E4QJD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

include/drm/drm_panel.h:270: warning: Function parameter or member 'followe=
r_lock' not described in 'drm_panel'

Introduced by commit

  de0874165b83 ("drm/panel: Add a way for other devices to follow panel sta=
te")

--=20
Cheers,
Stephen Rothwell

--Sig_/rfB=1CgUJuio3xNdF5E4QJD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmTJ2dAACgkQAVBC80lX
0GzEigf9GkZipAJ97rJJHzIQGzIBLx4DxDxnYu5qb6eYT8vM5YhA0m974OsBjkZM
xaukeiWxczEgnYy/DnLMwxZtV7XVALg0cuvE9KlA8OTKCaGCSXJM0cu19WjVFqNJ
tt9827VvLK/qfKuTpjm4C84UEMERipzBY10v75ZP47osAvBSyzmQgY/EsY61xvz3
aMGLwDrjUz4tYoYPhFTETtxDAexqj8y58o5TD8IaEY/p1NnEXJeSwYvBBscpxCge
MyS3MoGPpH2cGOrfkKh+l6Ew2gQfvUEjUtTDDEWYx1RDyhK9/RC9BlVoA7v0fW++
MjxxZKABac+dADLSEB+efpC31qt6wA==
=ncfs
-----END PGP SIGNATURE-----

--Sig_/rfB=1CgUJuio3xNdF5E4QJD--
