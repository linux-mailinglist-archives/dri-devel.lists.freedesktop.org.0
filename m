Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ABC324D22
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667BF6E11C;
	Thu, 25 Feb 2021 09:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C766E11C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:47:09 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 1DB8C1C0B81; Thu, 25 Feb 2021 10:47:05 +0100 (CET)
Date: Thu, 25 Feb 2021 10:47:04 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <20210225094704.GA4967@amd>
References: <20210224092304.29932-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210224092304.29932-1-tzimmermann@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 hdegoede@redhat.com, stern@rowland.harvard.edu, stable@vger.kernel.org,
 sean@poorly.run, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0340390915=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0340390915==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> USB devices cannot perform DMA and hence have no dma_mask set in their
> device structure. Therefore importing dmabuf into a USB-based driver
> fails, which breaks joining and mirroring of display in X11.
>=20
> For USB devices, pick the associated USB controller as attachment device.
> This allows the DRM import helpers to perform the DMA setup. If the DMA
> controller does not support DMA transfers, we're out of luck and cannot
> import. Our current USB-based DRM drivers don't use DMA, so the actual
> DMA device is not important.
>=20
> Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> instance of struct drm_driver.
>=20
> Tested by joining/mirroring displays of udl and radeon un der
> Gnome/X11.

Thanks for doing this.

Tested-by: Pavel Machek <pavel@ucw.cz>

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmA3chcACgkQMOfwapXb+vIvNgCgnkqccxMPEBZvAvoSGYP5Izg/
hOkAnjPFv3/Z+XyGHTA3IEpbRbEBFT5Z
=hOj3
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

--===============0340390915==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0340390915==--
