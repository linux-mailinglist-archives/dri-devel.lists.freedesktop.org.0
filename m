Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E044DD23D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 02:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF2E10E04C;
	Fri, 18 Mar 2022 01:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 655 seconds by postgrey-1.36 at gabe;
 Fri, 18 Mar 2022 01:06:50 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC6D10E04C;
 Fri, 18 Mar 2022 01:06:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KKQp007nCz4xL3;
 Fri, 18 Mar 2022 12:06:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1647565608;
 bh=jwCusHMaKLzSx+fT/PqroC11hLNZXj+hbjCzMuHR6Ls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d61mUW8Zhegt3VhoKSxr6QQd3ryKM24Xdsh+yZ/kPAluEJSLrb9o39iABBijT7Pv/
 quH7+h/lEY+8LXz94AF3sGsii1yL5HnV3yHZh14oB5sBl+8liqgAJa2pjEfVf9LSFB
 6upkUbzuYUHoXwfrUX+6eqRfZGmz+Ryq+wN8sUMU6Nzo9l2TI8ioVE/HOUrrI2ffvR
 f9oxVt88wayfbNf3BHpeEf/Ouu/fH/7BvXG0/giKCea8ClNkT1N7m3a0pS3sW5FYEk
 ClbtIeg5GbDNdspCY0YXTgUh8n1P9KD70bXXRGZg8IUownWN+qWVqAY6N82XbLDtRb
 eJaU8Is31M8oA==
Date: Fri, 18 Mar 2022 12:06:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20220318120647.2c89bf05@canb.auug.org.au>
In-Reply-To: <20220318115544.0c977415@canb.auug.org.au>
References: <20220318115544.0c977415@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G5twN28LIUIxKmeSldmhCtB";
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Julian Braha <julianbraha@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/G5twN28LIUIxKmeSldmhCtB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 18 Mar 2022 11:55:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/bridge/Kconfig
>=20
> between commit:
>=20
>   3c3384050d68 ("drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HE=
LPERS")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   803abfd8dda5 ("drm: bridge: fix unmet dependency on DRM_KMS_HELPER for =
DRM_PANEL_BRIDGE")
>=20
> from the drm tree.
>=20
> I fixed it up (I just used the latter) and can carry the fix as

But that failed during configuration, so I went back and used the
former change.

> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/G5twN28LIUIxKmeSldmhCtB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIz2ycACgkQAVBC80lX
0Gym7wf/e0IClI1oa2+eJ1eh3mGlRDgv2g9E2o7QjtJm69qjQlnTkU9VojX1l1UC
hlTU/Dy7Ftkp9R9fjx7xSRC+ZJCCApSAx635tdY/dHm8MeufPflRXT4t2Eu/d8R7
rlm9cCluUDib36ayR7mdLyGg3pYScTA5ilKS+ai43afsj9zPDHsWWmduGNFbIdbd
oib20XtTvdZJhz9a9QD/z9wIwfAUP3YAOvI+hyG4fhJcY5aZYvmwnbYHt2VCgqWL
hcp6a0GCZuAUZG4+aaWDJGBeVxzE0djG/XemYp90qBUNYd6U1Xmu+oXu0h5Ql2sD
oDF0LUMiVQYeV7GgGIJGrB0ui3jEqw==
=mpys
-----END PGP SIGNATURE-----

--Sig_/G5twN28LIUIxKmeSldmhCtB--
